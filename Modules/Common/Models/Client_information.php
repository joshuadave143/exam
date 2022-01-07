<?php
namespace Modules\Common\Models;
// use CodeIgniter\Model;
use \CodeIgniter\Model;
class Client_information extends Model
{ // protected $DBGroup      =   'default';
    protected $table        =   'client_information';
    protected $primaryKey   =   'ci_id';

    protected $returnType       =   'array';
    protected $useSoftDeletes   =   false;

    protected $allowedFields    =   [ 'sch_id', 'firstname','lastname','birthdate','age','address','phone_no','email','concerns','user_created','user_modified'];
    protected $useTimestamps    =   true;
    protected $createdField     =   'date_created';
    protected $updatedField     =   'date_modified';
    protected $deletedField     =   null;

    protected $validationRules  =   [];
    // protected $validationRules  =   ['sponsor_id'=>'required'];
    protected $validationMessages  =   [];
    protected $skipValidation   =   false;
}