<?php
namespace Modules\Common\Models;
// use CodeIgniter\Model;
use \CodeIgniter\Model;
class Schedule extends Model
{ // protected $DBGroup      =   'default';
    protected $table        =   'schedule';
    protected $primaryKey   =   'acct_id';

    protected $returnType       =   'array';
    protected $useSoftDeletes   =   false;

    protected $allowedFields    =   [ 'date', 'time','limit_to'];
    protected $useTimestamps    =   false;
    protected $createdField     =   null;
    protected $updatedField     =   null;
    protected $deletedField     =   null;

    protected $validationRules  =   [];
    // protected $validationRules  =   ['sponsor_id'=>'required'];
    protected $validationMessages  =   [];
    protected $skipValidation   =   false;
}