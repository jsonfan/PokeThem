<?php

class Poke extends CI_Model{
	function poke_user($post){
		//POST: user_poking , user_id_poked
		//update poked user count + 1
		//poked_from $user that is logged in
		// UPDATE users SET poke_count= poke_count + 1 WHERE id=?;
		$query1 = "UPDATE users SET poke_count= poke_count + 1 WHERE id = ?";
		$value1 = array($post['user_id_poked']);
		$this->db->query($query1, $value1);

		//INSERT POKE ROW
		$query2 = "INSERT INTO pokes (user_poking, user_poked, created_at, updated_at) 
					VALUES ( ?, ?, NOW(), NOW())";
		$value2 = array($post['user_poking'], $post['user_id_poked']);
		$this->db->query($query2, $value2);

	}

	function get_poked_from_list($user_id){
		//returns name and # times they poked the $user
		$query = "select  users.name , users.alias, users2.name as poker_name, users2.alias as poker_alias, count(*) as times_poked
				  from users
				  LEFT JOIN pokes 
				  ON users.id = pokes.user_poked
				  LEFT JOIN users as users2
				  ON users2.id = pokes.user_poking
				 	WHERE users.id = ?
					GROUP BY users.name, users2.name
					ORDER BY times_poked DESC";
		$values = array($user_id);
		return $this->db->query($query, $values)->result_array();

	}

	function get_distinct_pokes($user_id){
		//returns number of pokes user received from DISTINCT PEOPLE
		$query = "select COUNT(distinct users2.name ) as distinct_pokes 
				  from users
				  LEFT JOIN pokes 
				  ON users.id = pokes.user_poked
				  LEFT JOIN users as users2
				  ON users2.id = pokes.user_poking
				  WHERE users.id = ?";

		$values = array($user_id);
		return $this->db->query($query, $values)->row_array();

	}
}