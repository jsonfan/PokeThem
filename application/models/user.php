<?php

class User extends CI_Model{
	function get_user($user){
		return $this->db->query("SELECT * FROM users WHERE email = '{$user['email']}' AND password = '{$user['password']}'" , array($user))->row_array();
	}

	function add_user($user){
		$query = "INSERT INTO users (name, alias, email, password, poke_count, date_of_birth, created_at, updated_at) 
					VALUES (?,?,?,?,0, ?, NOW(), NOW())";
		$values = array($user['name'], $user['alias'], $user['email'], $user['password'], $user['date_of_birth']);
		return $this->db->query($query, $values);
	}

	function get_other_users($user_id){
		$query = "SELECT * FROM users WHERE id != ?";
		$values = array($user_id);
		return $this->db->query($query, $values)->result_array();
	}

}