<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pokes extends CI_Controller {

	public function __construct(){
		parent::__construct();
		//load db model
		$this->load->model('Poke');
	}
	function pokeuser($user_id_poked){
		$post = $this->input->post();
		$post['user_id_poked'] = $user_id_poked;
		//IN POST: user_poking , user_id_poked
		//update poke count for user_id_poked
		//insert poke row
		$this->Poke->poke_user($post);
		redirect('/main/profile');
	}

}