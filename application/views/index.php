<html>
<head>
	<title>Login and Registration</title>
	<style type="text/css">
		#register{
			display: inline-block;
			width: 400px;
		}
		#login{
			vertical-align: top;
			display: inline-block;
			width: 400px;
		}

	</style>
</head>
<body>
	<h1>Welcome!</h1>
	<div id='register'>
		<h1>Register</h1>
		<form action='/main/register' method='post'>
			<fieldset>
				<p>Name: </p>
				<input type='text' name='name' required/>
				<p>Alias: </p>
				<input type='text' name='alias' required/>
				<p>Email Address: </p>
				<input type='text' name='email' required/>
				<p>Password: </p>
				<p>*Password should be at least 8 characters.</p>
				<input type='password' name='password' required/>
				<p>Confirm Password: </p>
				<input type='password' name='confirm_password' required/>
				<p>Date of Birth: </p>
				<input type='date' name='date_of_birth' required/>
				<input type='submit' value='Register' />
			</fieldset>
		</form>
		<?= $this->session->flashdata('reg_error'); ?>
	</div>
	
	<div id='login'>
		<h1>Login</h1>
		<form action='/main/login' method='post'>
			<fieldset>
				<p>Email: </p>
				<input type='text' name='email' required/>
				<p>Password: </p>
				<input type='password' name='password' required/>
				<input type='submit' value='Login' />
			</fieldset>
			<?= $this->session->flashdata('login_error'); ?>
		</form>
	</div>
</body>
</html>