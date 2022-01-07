<?php

namespace Modules\Common\Controllers;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;
use Modules\Common\Libraries\Sidebar;
use Modules\Common\Libraries\Joshua_auth;
use Modules\Common\Libraries\User_roles;
/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 */

class OfficeBaseController extends Controller
{
	/**
	 * An array of helpers to be loaded automatically upon
	 * class instantiation. These helpers will be available
	 * to all other controllers that extend BaseController.
	 *
	 * @var array
	 */
	protected $helpers = [];
	public $data;
	public $joshua_auth;
	public $page_permissions;

	/**
	 * Constructor.
	 *
	 * @param RequestInterface  $request
	 * @param ResponseInterface $response
	 * @param LoggerInterface   $logger
	 */
	public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
	{
		// Do Not Edit This Line
		parent::initController($request, $response, $logger);

		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.: $this->session = \Config\Services::session();
		$this->session      = \Config\Services::session();
		$this->joshua_auth = new Joshua_auth();
		$this->data['name'] = $this->joshua_auth->get_session_data('name');
		
		if( date('H:i') == $this->joshua_auth->get_session_data('api_time_expired')){
			$this->joshua_auth->api_login();
		}

		/**
		 * 
		 * process roles
		 * 
		 * */

		$uri = explode('/',uri_string(true));
		$this->page_permissions = $this->session->get('user_role')[$uri[2]];
		// print('<pre>'.print_r( $this->session->get('user_role')).'</pre>');

		date_default_timezone_set('Asia/Manila');
	}


	protected function load_sidebar($params){
		$params['username'] = 
			($this->joshua_auth->get_session_data('user_type') == 'admin'
				?'admin/':'office/').$this->joshua_auth->get_session_data('username');

		$sidebar = new sidebar($params);
		$sidebar->process_page_properties();
		
		// echo var_dump($this->sidebar->get_page_properties());
		return array_merge($this->data, $sidebar->get_page_properties());
	}
}
