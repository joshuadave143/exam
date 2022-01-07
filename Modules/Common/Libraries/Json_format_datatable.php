<?php
namespace Modules\Common\Libraries;

use Modules\Common\Models\User_roles_column_names;
class Json_format_datatable{
    public $btn = '';
    public $properties = array();
    public $case = array();
    public $ifelse = array();
    public $change_value_defined = array();
    public $change_value_undefined = array();

    function __construct()
    {   
        $this->session              = \Config\Services::session();

    }

    function json_format($data,$fields){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                if( count($this->getTextStyle()) != 0 && array_key_exists($fields[$e],$this->properties)):
                    $json .=$this->Textstyle($this->properties[$fields[$e]],$data[$i][$fields[$e]],$fields[$e]);
                else:
                    // var_dump($data);
                    // print_r(array_key_exists($fields[$e],$this->change_value_undefined).' ===') 
                    // print sprintf("%b", (count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined))); // prints 0
                    $json .= '"'.(count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined)?
                                $this->change_value_undefined[$fields[$e]]:
                                $data[$i][$fields[$e]]).'"';
                endif;
            }
            $json .= $this->getButton() != ''?','.$this->getButton():'';
            // $json .= (($TEMP[$i]->ta_received_date == '' or $TEMP[$i]->ta_received_date == "0000-00-00")?'"<a class=\"sign\" href=\"\">Click to Sign</a>"':'"Signed"');
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function json_format_with_label_for_item_code($data){
        $json = '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "{";
            
              
            $json .= 'item_code :"'.$data[$i]['item_code'].'",';
            $json .= 'id :"'.$data[$i]['inv_h_id'].'",';
            $json .= 'quantity :"'.$data[$i]['quantity'].'"';
               
            
            
            $json .=  "}";
        }
        $json .=  "]";
        return $json;
    }

    function json_format_inventory_h($data,$fields){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                
                if( count($this->getTextStyle()) != 0 && array_key_exists($fields[$e],$this->properties)):
                    $json .=$this->Textstyle($this->properties[$fields[$e]],$data[$i][$fields[$e]],$fields[$e]);
                else:

                    $json .= '"'.(count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined)?
                                $this->change_value_undefined[$fields[$e]]:
                                $data[$i]->{$fields[$e]}).'"';
                endif;
            }
            $json .= $this->getButton() != ''?','.$this->getButton():'';
            
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function json_format_inventory($data,$fields){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                
                if( count($this->getTextStyle()) != 0 && array_key_exists($fields[$e],$this->properties)):
                    $json .=$this->Textstyle($this->properties[$fields[$e]],$data[$i][$fields[$e]],$fields[$e]);
                else:

                    $json .= '"'.(count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined)?
                                $this->change_value_undefined[$fields[$e]]:
                                $data[$i][$fields[$e]]).'"';
                endif;
            }
            $json .= $this->getButton() != ''?','.$this->getButton():'';
            
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function json_format_inventory_logs($data,$fields){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                
                if( count($this->getTextStyle()) != 0 && array_key_exists($fields[$e],$this->properties)):
                    $json .=$this->Textstyle($this->properties[$fields[$e]],$data[$i][$fields[$e]],$fields[$e]);
                else:

                    $json .= '"'.(count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined)?
                                $this->change_value_undefined[$fields[$e]]:
                                $data[$i][$fields[$e]]).'"';
                endif;
            }
            if($data[$i]['date_returned'] != '0000-00-00'){
                $json .= ',""';
            }
            else{                
                $json .= $this->getButton() != ''?','.$this->getButton():'';
            }
            
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function op_ship_to_and_vendor($cname,$raw){
        if( $cname == 'ship_to' ) {
            return $raw['s_owner_name'].'<br>'.$raw['s_c_name'].'<br>'.$raw['s_address'];            
        }
        elseif( $cname == 'vendor_detials' ){
            return $raw['v_name'].'<br>'.$raw['v_address'].'<br>'.$raw['v_contact_d'];  
        }

        return $raw[$cname];
    }

    function json_format_po($data,$fields,$roles){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
            $json .='"<span class=\"row-details row-details-close\"></span>",';
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                
                if( count($this->getTextStyle()) != 0 && array_key_exists($fields[$e],$this->properties)):
                    $json .=$this->Textstyle($this->properties[$fields[$e]],$data[$i][$fields[$e]],$fields[$e]);
                else:

                    $json .= '"'.(count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined)?
                                $this->change_value_undefined[$fields[$e]]:
                                $this->op_ship_to_and_vendor($fields[$e],$data[$i])).'"';
                endif;
            }
            if( $data[$i]['pdfname'] != '' ){
                $buttons = '"<div class=\"btn-group btn-group-solid\" style=\"display: flex;\">';
                if($roles['print']
                        && $this->session->get('user_type') != 'admin' ){
                    $buttons .='<a class=\"print btn btn-info\" data-toggle=\"tooltip\" target=\"_TOP\" data-placement=\"top\" title=\"Print\" href=\"#\"><span class=\"fa fa-print\"></span> </a>';   
                }
                if( $roles['delete']
                        && $this->session->get('user_type') == 'admin'  ){
                    $buttons .='<a class=\"delete btn btn-danger\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Delete\" href=\"\"><span class=\"fa fa-trash-o\"></span> </a>';
                }
                // $buttons .=$data[$i]['status'] == 'DELIVERED'?'':'<a class=\"upload btn btn-primary start\" data-placement=\"top\" title=\"Upload\" href=\"#fileupload\" data-toggle=\"modal\"><span class=\"fa fa-upload\"></span> </a>';

                $buttons .= '</div>"';
                $json .= ','.$buttons;
            }
            else{
                $json .= $this->getButton() != ''?','.$this->getButton():'';
            }
            
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function json_format_deli($data,$fields,$roles){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
            $json .='"<span class=\"row-details row-details-close\"></span>",';
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                
                if( count($this->getTextStyle()) != 0 && array_key_exists($fields[$e],$this->properties)):
                    $json .=$this->Textstyle($this->properties[$fields[$e]],$data[$i][$fields[$e]],$fields[$e]);
                else:

                    $json .= '"'.(count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined)?
                                $this->change_value_undefined[$fields[$e]]:
                                $data[$i][$fields[$e]]).'"';
                endif;
            }
            if( $data[$i]['pdfname'] != '' ){

                $buttons = '"<div class=\"btn-group btn-group-solid\" style=\"display: flex;\">';
                if( $roles['update'] 
                        && $this->session->get('user_type') != 'admin' ){
                    $buttons .=$data[$i]['status'] == 'DELIVERED' || $data[$i]['status'] == 'CANCELLED'?'':'<a class=\"cancel btn btn-danger\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Cancel\" href=\"\"><span class=\"fa fa-ban\"></span> </a>';
                }
                if( $roles['print'] 
                        && $this->session->get('user_type') != 'admin' ){
                    $buttons .='<a class=\"print btn btn-info\" data-toggle=\"tooltip\" onclick=\"pop_up(\'delivery_receipt/print\')\" target=\"_TOP\" data-placement=\"top\" title=\"Print\" href=\"#\"><span class=\"fa fa-print\"></span> </a>';   
                }
                if( $roles['update'] 
                        && $this->session->get('user_type') != 'admin' ){
                    $buttons .=$data[$i]['status'] == 'DELIVERED' || $data[$i]['status'] == 'CANCELLED'?'':'<a class=\"upload btn btn-primary start\" data-placement=\"top\" title=\"Upload\" href=\"#fileupload\" data-toggle=\"modal\"><span class=\"fa fa-upload\"></span> </a>';
                }

                if($roles['delete'] && $this->session->get('user_type') == 'admin'){
                    $buttons .='<a class=\"delete btn btn-danger\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Delete\" href=\"\"><span class=\"fa fa-trash-o\"></span> </a>';
                }


                $buttons .= '</div>"';
                $json .= ','.$buttons;
            }
            else{
                if( $data[$i]['status'] == 'CANCELLED'){
                    $buttons = '"<div class=\"btn-group btn-group-solid\" style=\"display: flex;\">';
                    if( $roles['print']
                        && $this->session->get('user_type') != 'admin' ){
                        $buttons .='<a class=\"print btn btn-info\" data-toggle=\"tooltip\" onclick=\"pop_up(\'delivery_receipt/print\')\" target=\"_TOP\" data-placement=\"top\" title=\"Print\" href=\"#\"><span class=\"fa fa-print\"></span> </a>';   
                    }

                    if($roles['delete'] && $this->session->get('user_type') == 'admin'){
                        $buttons .='<a class=\"delete btn btn-danger\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Delete\" href=\"\"><span class=\"fa fa-trash-o\"></span> </a>';
                    }

                    $buttons .= '</div>"';
                    $json .= ','.$buttons;
                }
                else{
                    $json .= $this->getButton() != ''?','.$this->getButton():'';
                }
            }
            
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function json_format_invoice($data,$fields){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
            $json .='"<span class=\"row-details row-details-close\"></span>",';
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                
                if( count($this->getTextStyle()) != 0 && array_key_exists($fields[$e],$this->properties)):
                    $json .=$this->Textstyle($this->properties[$fields[$e]],$data[$i][$fields[$e]],$fields[$e]);
                else:
 

                    if( $fields[$e] == 'date_paid' && 
                        $data[$i][$fields[$e]] == '0000-00-00'):
                        if( $this->session->get('user_type') != 'admin' ){
                            $json .='"<a class=\"paid btn btn-primary\" data-toggle=\"modal\" data-placement=\"top\" title=\"Update status\" href=\"#paid\"><span class=\"fa fa-qrcode\"></span> </a>"';
                        }
                        else{
                            $json .='""'; 
                        }
                    else:

                        $json .= '"'.(count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined)?
                                $this->change_value_undefined[$fields[$e]]:
                                $data[$i][$fields[$e]]).'"';
                    endif;
                endif;
            }
            $json .= $this->getButton() != ''?','.$this->getButton():'';
           
            
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function json_format_acc($data,$fields){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                if( count($this->getTextStyle()) != 0 && array_key_exists($fields[$e],$this->properties)):
                    $json .=$this->Text_to_button($this->properties[$fields[$e]],$data[$i][$fields[$e]],$fields[$e]);
                else:
                    $json .= '"'.(count($this->change_value_undefined) != 0 && array_key_exists($fields[$e],$this->change_value_undefined)?
                                $this->change_value_undefined[$fields[$e]]:
                                $data[$i][$fields[$e]]).'"';
                endif;
            }
            $json .= $this->getButton() != ''?','.$this->getButton():'';
           
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function checkbox($data,$name,$label){
        return '<label class=\"checkbox-inline\"><input type=\"checkbox\" class=\"permisions\" data-name=\"'.$name.'\" value=\"1\" '.($data == 1?'checked':'').' >'.$label.'</label>';
    }

    function json_format_role($data){
        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
           
            
               
            $json .= '"'.$data[$i]['role_id'].'",';
            $json .= '"'.$data[$i]['document_type'].'",';
            $json .= '"'.$data[$i]['user_type'].'",';
            $json .= '"'.$data[$i]['role'].'",';
            // $json .= '"<div class=\"form-group\"><div class=\"checkbox-list\">';
            $json .= '"'.$this->checkbox($data[$i]['view'],'view','Read');
            $json .= $this->checkbox($data[$i]['update'],'update','Update');
            $json .= $this->checkbox($data[$i]['add'],'add','Create');
            // $json .=   '</div><div class=\"checkbox-list\">';
            $json .= $this->checkbox($data[$i]['delete'],'delete','Delete');
            $json .= $this->checkbox($data[$i]['print'],'print','Print');
            $json .= $this->checkbox($data[$i]['export'],'export','Export');
            $json .= '",';
             
            
            $json .= '"<a class=\"btn btn-success col_names\" data-toggle=\"modal\" data-id=\"'.$data[$i]['sys_doc_id'].'\" href=\"#cn_modal\"><span class=\"fa  fa-file-code-o\"></span></a>"';
            $json .= $this->getButton() != ''?','.$this->getButton():'';
            
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }

    function json_format_colname_edit($data,$role_id){

        $User_roles_column_names = new User_roles_column_names;

        $json = '{"data":';
        $json .= '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "[";
               
            $json .= '"'.$data[$i]['col_id'].'",';
            $json .= '"'.$data[$i]['name'].'",';
            $is_select = $User_roles_column_names->where('role_id',$role_id)
                                    ->where('col_id',$data[$i]['col_id'])
                                    ->countAllResults();
            $json .= '"<input type=\"checkbox\" class=\"col_name_edit\" value=\"1\" '.($is_select == 1?'checked':'').' >"';
             
            
            
            $json .=  "]";
        }
        $json .=  "]";
        $json .=  '}';
        return $json;
    }


    function Textstyle($style,$text,$fieldname = null){
        if( count($this->case) > 0 && array_key_exists($fieldname,$this->case) ){
            $style = $this->case[$fieldname] == $text?$this->ifelse[$fieldname.'_'.$text]:$style;            
        }
        $text = $this->change_value_defined[$fieldname.'_'.$text];
        return '"<span class=\"'.$style.'\">'. $text.'</span>"' ;
    }

    function Text_to_button($style,$text,$fieldname = null){
        if( count($this->case) > 0 && array_key_exists($fieldname,$this->case) ){
            $style = $this->case[$fieldname] == $text?$this->ifelse[$fieldname.'_'.$text]:$style;            
        }
        @$text = $this->change_value_defined[$fieldname.'_'.$text];
        return '"<button class=\"'.$style.'\">'. $text.'</button>"' ;
    }

    function getButton(){
        return $this->btn;
    }

    function setButton($btn){
        $this->btn = $btn;
    }

    function getTextStyle(){
        return $this->properties;
    }
    /**
     * $properties array() array of data
     * $case array() of case use in ifelse
     * $ifelse array() of conditions statements
     * $change_value_defined array() of data that will be change
     */
    function setTextStyle($properties,$case = array(),$ifelse = array(), $change_value_defined = array(), $change_value_undefined = array()){
        $this->properties               = $properties;
        $this->case                     = $case;
        $this->ifelse                   = $ifelse;
        $this->change_value_defined     = $change_value_defined;
        $this->change_value_undefined   = $change_value_undefined;
    }

    /**
     * for nodes
     */

    function json_format_node($data,$fields){
        $json = '[';
        for( $i = 0; $i < count($data); $i++ ){
            if($i>=1){
                $json .= ',';
            }
            $json .=  "{";
            for( $e = 0; $e < count($fields); $e++ ){
                if($e>=1){
                    $json .= ',';
                }
                $json .= '"'.$fields[$e].'":"'.$data[$i]->{$fields[$e]}.'"';
            }
            
            $json .=  "}";
        }
        $json .=  "]";
        return $json;
    }
}
