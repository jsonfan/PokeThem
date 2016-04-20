<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/main
	 *	- or -  
	 * 		http://example.com/index.php/main/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/main/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct(){
		parent::__construct();
		//load db model
		$this->load->model('User');
		$this->load->model('Poke');
		$this->load->library('form_validation');
		//$this->output->enable_profiler(TRUE);
	}

	public function index()
	{
		$this->load->view('index');
	}

	public function register(){
		//echo "REGISTER";
		//USE CI FORM VALIDATION CLASS
		//EMAIL EXISTS IN DB?
		//EMAIL ENTERED PROPERLY?
		//PASSWORD AT LEAST 8 CHAR
		//PASSWORD AND CONFIRM PW SAME
		$this->form_validation->set_rules('name', 'Name', 'trim|required');
		$this->form_validation->set_rules('alias', 'Alias', 'trim|required');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[8]|matches[confirm_password]');
		$this->form_validation->set_rules('confirm_password', 'Confirm Password', 'trim|required');

		if($this->form_validation->run() === FALSE){
			$this->session->set_flashdata('reg_error', validation_errors());
			redirect('/main');
		} else {
			//STORE IN DB
			$post = $this->input->post();
			$this->User->add_user($post);
			redirect('/main');
		}
	}

	public function login(){
		//process the login
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[8]');
		if($this->form_validation->run() === FALSE){
			//login errors
			$this->session->set_flashdata('login_error', validation_errors());
			redirect('/main');
		} else {
			
			$post = $this->input->post();
			$user = $this->User->get_user($post);

			if($user){ //post === valid entry in db?
				//login
				$this->session->set_userdata('user', $user);
				redirect('/main/profile');

			} else {
				//invalid combo
				$this->session->set_flashdata('login_error', "Invalid email and password combination!");
				redirect('/main');
			}
		}
	}

	public function profile(){
		//$post = $this->session->post();
		$user = $this->session->userdata('user');
		//load other users and poke history
		$other_users = $this->User->get_other_users($user['id']);
		//load who poked user and how many times
		$poked_from_list = $this->Poke->get_poked_from_list($user['id']);
		//load how many times the user was poked by distinct people
		$distinct_pokes = $this->Poke->get_distinct_pokes($user['id']);

		$view_data['number_of_people_that_have_poked_user'] = $distinct_pokes['distinct_pokes'];
		$view_data['other_users'] = $other_users;
		$view_data['poked_from_list'] = $poked_from_list;

		$this->load->view('welcome_view', $view_data);
	}

	public function logout(){
		$this->session->sess_destroy();
		redirect('/main');
	}

}

/* End of file main.php */
/* Location: ./application/controllers/main.php */