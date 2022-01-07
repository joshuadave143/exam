<?php 
namespace Modules\Common\Libraries;

use Modules\Common\Models\Account;
use Modules\Common\Models\User_roles;

use Modules\Common\Libraries\PasswordHash;

use \Modules\Common\Libraries\Oauth;
use \OAuth2\Request;
/**
* 
* 
* @package 	Joshua_auth
* @author	Joshua Dave Tonido
* @version	2.0.0
*/

class Joshua_auth {

    public $error;
    public $has_error;
    public $url_segments;
    public $session;

	function __construct() {        
        
        $this->session              = \Config\Services::session();
        $this->Account              = new Account;
        $this->User_roles           = new User_roles;
        $this->url_segments         = explode('.', $_SERVER['HTTP_HOST']);
    }

	function get_error_message()
	{
		return $this->error;
	}

    function is_logged_in()
	{
		return $this->get_session_data('logged_in');
    }

    function admin_role($permission){
        $db = \Config\Database::connect();
        $syst_column_names = $db->table('system_doc_type_column_names sdcn');

        $result = $syst_column_names->select('sdcn.sys_doc_id, sdt.name, sdt.short_name')
                ->from('system_doc_type sdt')
                ->where('sdt.sys_doc_id 
                        = sdcn.sys_doc_id')
                ->groupBy('sys_doc_id')
                ->get()->getResult();
        foreach($result as $row){

            $column_names = $db->table('column_names cn')
                            ->from('system_doc_type_column_names sdcn')
                            ->where('sdcn.col_id = cn.col_id')
                            ->where('sdcn.sys_doc_id',$row->sys_doc_id)
                            ->get()
                            ->getResult();
            $tmp_column_name    = [];
            $tmp_db_column_name = [];
            foreach ($column_names as $cn) {
                $tmp_column_name[]=$cn->name;
                $tmp_db_column_name[]=$cn->col_name;
            }

            $roles_list['user_role'][$row->short_name] = [
                'view'      => $permission['view'],
                'add'       => $permission['add'],
                'delete'    => $permission['delete'],
                'update'    => $permission['update'],
                'print'     => $permission['print'],
                'export'    => $permission['export'],
                'column_names'    => $tmp_column_name,
                'db_column_name'  => $tmp_db_column_name
            ];

           
        }

        return $roles_list;
    }

    function role_settings($user){
        $roles = $this->User_roles->where('role',$user['role_group'])->findAll();

        $this->session->set($roles[0]);
        if( $roles[0]['user_type'] == 'admin' ){
            return $this->admin_role($roles[0]);
        }
        $roles_list = [];
        foreach ($roles as $row) {
            $column_names = $this->User_roles
                        ->select('cn.*')
                        ->join('user_roles_column_names as urcn', 'user_roles.role_id = urcn.role_id', 'left')
                        ->join('column_names as cn', 'urcn.col_id = cn.col_id', 'left')
                        ->where('user_roles.role_id',$row['role_id'])
                        ->orderBy('urcn.urcn_id')
                        ->findAll();
            $tmp_column_name    = [];
            $tmp_db_column_name = [];
            foreach ($column_names as $cn) {
                $tmp_column_name[]=$cn['name'];
                $tmp_db_column_name[]=$cn['col_name'];
            }

            $roles_list['user_role'][$row['short_name']] = [
                'view'      => $row['view'],
                'add'       => $row['add'],
                'delete'    => $row['delete'],
                'update'    => $row['update'],
                'print'     => $row['print'],
                'export'    => $row['export'],
                'column_names'    => $tmp_column_name,
                'db_column_name'  => $tmp_db_column_name
            ];
        }

        return $roles_list;
    }

    function login( $username, $password, $remember = ""){
        $idno = str_replace("'", "", $username);
      
        // $member = $members->find($id);
        if( !is_null( $user = $this->Account->where('username', htmlentities( $username ))->first() ) ){
            $hasher = new PasswordHash(8, FALSE);
            // echo $password = $hasher->HashPassword($password);
            // return;
             // check the status if it is active or not
            if( $user['active'] == 1 ){
              
                if( $hasher->CheckPassword( $password, $user['password'] ) ){
                    $user['logged_in'] = true;
                    
                    $this->session->set($this->role_settings($user));

                    // print("<pre>".
                    // print_r($roles_list,true)."</pre>");
                    $this->session->set($user); 
                    return $user;
                }
                else{
                    $this->error = array('err_msg' => 'Incorrect password.');
                    $this->has_error = TRUE;
                }
            }
            else{
                $this->error = array('err_msg' => 'You are not allowed to login. <br>Because Your Account Status is deactivated.');
			    $this->has_error = TRUE;
            }
            
            // if( $hasher->CheckPassword( $password, $admin->password ) ){
            
        }
        else{
            $this->error = array('err_msg' => 'Incorrect username and/or password. ');
			$this->has_error = TRUE;
        }

        return null;
        
    }
    

	function get_session_id()
	{
		return session_id();
	}

    function get_session_data($key)
	{
		$sess_val = $this->session->get($key);

		if ($key == 'last_login') {
			$last_login = date_create($sess_val);
			$sess_val = date_format($last_login, 'Y-m-d H:i:s');
		}

		return $sess_val;
    }

    function set_session_data($name,$val){
        $this->session->set($name,$val);
    }
    
    function logout()
	{
		$this->session->set(array());
        $this->session->destroy();
    }


    function register($username, $password){
        $username           = str_replace("'", "", $username);
        $password           = str_replace("'", "", $password);
        $hasher             = new PasswordHash(8, FALSE);

        echo $password           = $hasher->HashPassword($password);
        $data = [
            'username'              => $username,
            'password'              => $password
        ];
        $post_id = $this->Account->insert($data);

        $data = [
            'acct_id'               => $post_id
        ];
     
        $this->User_roles->save($data);
        return  ($this->Account->affectedRows() != 1) ? false : true;
       
    }

    public function api_login(){
		$_POST['username'] = "qwerty123";
        $_POST['password'] = 'Qw3rty!@#';
        $_POST['grant_type'] = 'password';
        $_SERVER['PHP_AUTH_USER'] = 'report_api';
        $_SERVER['PHP_AUTH_PW'] = 'Qw123qa!@#$';
        $_SERVER['REQUEST_METHOD'] = 'POST';
        $oauth = new Oauth();
        $request = new Request();
        $respond = $oauth->server->handleTokenRequest($request->createFromGlobals());
        $code = $respond->getStatusCode();
		$body = $respond->getResponseBody();
        
		$time = strtotime(date('H:i')) + 60*59;
		$time = date('H:i', $time);
		$this->set_session_data('api_time_expired',$time);
        // print_r(json_decode($body));
		$this->set_session_data('access_token', json_decode($body)->access_token);
	}
}