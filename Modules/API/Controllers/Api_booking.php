<?php
namespace Modules\API\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;

use Modules\Common\Models\Client_information;

class Api_booking extends ResourceController
{
    protected $modelName = 'Modules\Common\Models\Schedule';
    protected $format    = 'json';

    use ResponseTrait;

    function __construct()
	{	
        $this->session              = \Config\Services::session();

        $this->Client_information     = new Client_information;
    }

    public function index(){
        
    }

    function process_data($data){
        // var_dump($data);
        $split_parameters = explode('&', urldecode($data));

        for($i = 0; $i < count($split_parameters); $i++) {
            $final_split = explode('=', $split_parameters[$i]);
            $split_complete[$final_split[0]] = $final_split[1];

        }
        return $split_complete;
    }

    public function create(){
        try {
            $raw_data = $this->request->getPost();
            $data = $this->process_data($raw_data['data']);

            $sched_data['time']=$data['time'];
            $sched_data['date']=$data['date'];
            $sched_data['limit_to'] = 20;

            unset($data['time']);
            unset($data['date']);

            $id = $this->model->insert($sched_data);
            $data['sch_id'] = $id;


            $this->Client_information->insert($data);
            
            $response = [
                'status'   => 200,
                'error'    => null,
                'messages' => [
                    'success' => 'Appointment successfully submitted, Please check your email a day before appointment schedule.'
                ]
            ];

            return $this->respond($response);
        } catch (\Exception $e) {

            $this->response->setStatusCode(500);
            $response = [
                'messages' => [
                    'error' => $e->getMessage()
                ]
            ];

            return $this->response->setJSON($response);
        }
        
    }
    
}