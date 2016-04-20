<?php  $user = $this->session->userdata('user'); ?>
<html>
<head>
	<title>Welcome</title>
	<style type="text/css">
		table, th, td{
			border: 1px solid black;
		}
		#poked_you{
			border: solid black;
			width: 450px;
		}
		#header h1, a{
			display: inline-block;
		}
		#welcome{
			width: 300px;
		}
		#logoff{
			margin-left: 100px;
		}
		#wrapper{
			width: 960px;
		}
	</style>
</head>
<body>
	<div id='wrapper'>

		<div id='header'>
			<h1 id='welcome'>Welcome <?= $user['alias'] ?></h1> 
			<a id='logoff' href="/main/logout">Log Off</a>
		</div>
		<h2><?= $number_of_people_that_have_poked_user ?> people poked you!</h2>
		<div id='poked_you'>
<?php
			if($number_of_people_that_have_poked_user > 0 ){
				foreach($poked_from_list as $poked_from){
?>
					<p><?= $poked_from['poker_alias'] ?> poked you <?= $poked_from['times_poked']?> times.</p>
<?php
				}
			}
?>
		</div>

		<p>People you may want to poke:</p>
		<!-- LIST OF USERS OTHER THAN YOURSELF -->
		<table>
			<thead>
				<tr>
					<td>Name</td>
					<td>Alias</td>
					<td>Email Address</td>
					<td>Poke History</td>
					<td>Action</td>
				</tr>	
			</thead>
				
<?php
					foreach($other_users as $other_user){
?>
					<tr>
						<td><?= $other_user['name'] ?></td>
						<td><?= $other_user['alias']?></td>
						<td><?= $other_user['email']?></td>
						<td><?= $other_user['poke_count']?> pokes</td>
						<td>
							<form action='/pokes/pokeuser/<?=$other_user['id']?>' method='post'>
								<input type='hidden' value='<?= $user['id']?>' name='user_poking'>
								<input type='submit' value='Poke!'>
							</form>

						</td>
					</tr>
<?php			}
?>				
				
		</table>
	</div>
</body>
</html>