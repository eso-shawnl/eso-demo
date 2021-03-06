<?php
class ModelLocalisationPage extends Model {

	public function addPage($data) {

		if(isset($data['page_name']) && !empty($data['page_name'])){

			$result=array();
			if(isset($data['page_id']) && !empty($data['page_id'])){
				$_page_id=$data['page_id'];
			}
			else {
				$page_name=$data['page_name'];
				
				$this->db->query("call addPageByName('$page_name',@_page_id,@_reason)");
					
				$_page_id=get_object_vars($this->db->query("SELECT @_page_id"))['row']['@_page_id'];
					
				$_reason=get_object_vars($this->db->query("SELECT @_reason"))['row']['@_reason'];
			}
			if($_page_id<>0){
				
				$i=0;
				
				if(isset($data['page_attribute']) && !empty($data['page_attribute'])){
					
					foreach ($data['page_attribute'] as $val){
							
						if(isset($val) && !empty($val) && !empty($val['name'])){
					
							$name=trim($val['name']);
							
							if(isset($data['page_attribute']) && !empty($data['page_attribute'])){
								
								foreach ($val['page_attribute_description'] as $k =>$v){
										
									if((isset($v['text']) && !empty($v['text']))
											&& (isset($k) && !empty($k))){

										$language_id=$k;
						
										$description=trim(addslashes($v['text']));
						
										$this->db->query("call addLangData('$name','$description',$language_id,$_page_id,@_result,@_reason)");	
										
										$_result1=get_object_vars($this->db->query("SELECT @_result"));
											
										$_reason1=get_object_vars($this->db->query("SELECT @_reason"));
						
										$result[$i++]=array('key'=>$name,'value'=>$v['text'],'result'=>$_result1['row']['@_result'],'reason'=>$_reason1['row']['@_reason']);
										
									}
								}
							}
						}
					}
					return $result;
				}	
			}
			else{
				$result['0']=array('result'=>false,'reason'=>$_reason);
			}
		}
		else {
			$result['0']=array('result'=>false,'reason'=>'Page name is null!');
		}
	}

	public function editPage($data) {
		
		$result=array();
		
		if(isset($data['page_id']) && !empty($data['page_id'])){
			
			$p_id=$data['page_id'];
			
			$i=0;
			
			foreach ($data['caption'] as $key =>$val){
				
				if ($val['status']=='update'){
					
					$value=addslashes($val['value']);

					$this->db->query("call updateLangData('$value',$key,$p_id,@result,@reason)");
					
					$_result=get_object_vars($this->db->query("SELECT @result"));
					
					$_reason=get_object_vars($this->db->query("SELECT @reason"));
					
					$result[$i++]=array('key'=>$key,'value'=>$val['value'],'result'=>$_result['row']['@result'],'reason'=>$_reason['row']['@reason']);
					
				}
				if ($val['status']=='delete'){
				
					$this->db->query("call deleteLangData($key,$p_id,@result,@reason)");
						
					$_result=get_object_vars($this->db->query("SELECT @result"));
						
					$_reason=get_object_vars($this->db->query("SELECT @reason"));
						
					$result[$i++]=array('key'=>$key,'value'=>$val['value'],'result'=>$_result['row']['@result'],'reason'=>$_reason['row']['@reason']);
						
				}
			}
		}
		else {
			$result['0']=array('result'=>false,'reason'=>'page id is null!');
		}
		return $result;
	}

	public function deletePage($page_id) {

		$result=array();

        $this->db->query("call deletePageByID($page_id,0,@result,@reason)");

        $_result=get_object_vars($this->db->query("SELECT @result"));

        $_reason=get_object_vars($this->db->query("SELECT @reason"));

        $result[0]=array('key'=>$page_id,'value'=>'','result'=>$_result['row']['@result'],'reason'=>$_reason['row']['@reason']);

		return $result;
	}

	public function getPage($page_id) {

		$query = $this->db->query("SELECT DISTINCT * FROM tb_page WHERE page_id = " . (int)$page_id );

		return $query->row;
	}

	public function getPages($data = array()) {

			$sql = "SELECT * FROM tb_page";

			if (!empty($data['filter_name'])) {
				$sql .= " where name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
			}
			
			$sql .= " GROUP BY page_id";
			
			$sort_data = array(
				'page_id',
				'name'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY name";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		
	}

	public function getPagesList() {
		$sql = "SELECT * FROM tb_page";
	
		$query = $this->db->query($sql);
	
		return $query->rows;
	
	}
	
	public function getTotalPages($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.page_id) AS total FROM tb_page p ";

		if (!empty($data['filter_name'])) {
			$sql .= " where name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	

}
