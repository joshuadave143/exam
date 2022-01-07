<?php
	namespace Modules\Customer_app\Controllers;

	use \CodeIgniter\Controller;
	use \CodeIgniter\API\ResponseTrait;

	class Information extends \Modules\Common\Controllers\CustomerBaseController
	{
		use ResponseTrait;

		public $parser; 
		public function __construct(){
	        $this->parser = \Config\Services::parser();

	        $this->data['css_entries'] = array();
			$this->data['js_entries'] = array();
			$this->data['js_plug'] = array();
			
			$this->data['css_custom'] = "";
			$this->data['js_init'] = "";
			
			$this->data['js_custom'] = "";
	        $this->data['msgbox'] = "";
			$this->data['message'] = "";
	    }

	    public function index(){
	    	if( isset($_POST['date']) && $_POST['time'] != '' ){
	    		$this->session->set($_POST);
	    	}
	    	else{
	    		return redirect()->to(base_url('/'));
	    	}
	        array_push($this->data['css_entries'],

				array('css_link' => base_url().'/assets/plugins/bootstrap-datepicker/css/datepicker.css'),
				array('css_link' => base_url().'/assets/plugins/bootstrap-toastr/toastr.min.css'),
				array('css_link' => base_url().'/assets/plugins/select2/select2.css'),
				array('css_link' => base_url().'/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css'),

				
			);
			array_push($this->data['js_entries'],
				array('js_link' => base_url().'/assets/plugins/bootstrap-toastr/toastr.min.js'),
				array('js_link' => base_url().'/assets/plugins/select2/select2.min.js'),
				array('js_link' => base_url().'/assets/plugins/datatables/media/js/jquery.dataTables.min.js'),
				array('js_link' => base_url().'/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js'),
				array('js_link' => base_url().'/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js'),
				array('js_link' => base_url().'/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js'),
				array('js_link' => base_url().'/assets/scripts/information.js')
	        );
	        
	        $this->data['js_init']      = " 
	                                    information.init()
	                                        ;"; 
			$this->data['title']        = 'Online Customer Appointment System';
			$this->data['page']         = 'Modules\Customer_app\Views\Information';
	        $this->data['css_custom']   = "";
	        $this->data['js_custom']    = "";
	        $this->data['time'] = $_POST;


	        $side['side_bar'] = $this->load_sidebar(array('item_index' => 2, 'sub_index' => 0, 'page_title' => 'Dashboard', 'show_page_title' => 1, 'show_breadcrumbs' => 1, 'user_type' => 0));

	        $this->data['side_bar_template'] = view('Modules\Template\Views\template\page-sidebar',$side['side_bar'] );
	        $this->data['template'] = view('Modules\Template\Views\default-page',$this->data);
	        echo $this->parser->setData($this->data)
	                            ->renderString($this->data['template']);
	    }
	}