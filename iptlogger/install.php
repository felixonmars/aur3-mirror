<?php
/**********************************************************
*This file is meant for setting up database and user      *
*that is needed for Iptables Analyzer.                    *
*                                                         *
*2005 Sven Kauber <celeon@gmail.com>        	          *
*This file is distributed under GPL License               *
*							  *
* Todo:							  *
*    -disable the need for exec - include data instead	  *
**********************************************************/

$SETUP = array('host','port','ipadmin','ipadminpass','ipuser','ipauserpass','rootuser','rootpass','dbname','urlbase','logfile');
ob_start();

function isAllSet()
//checks if some field was empty
//gets an array of values as parameter
{
   global $SETUP;
   $res = true;
   for($i = 0; $i < count($SETUP); $i++)
   {
      if(trim($_POST[$SETUP[$i]]) == '')
      {
         $res = false;
         break;
      }
   }
   return $res;
}

$OK = '
<pre>
         All went OK!

           /(|
          (  :
         __\  \  _____
       (____)  `|
      (____)|   |
       (____).__|
        (___)__.|_____

</pre>';

$NOTOK = '
<pre>
            ____
           /\   \
          /  \___\
         _\  / __/_
        /\ \/_/\   \
       /  \___\ \___\
      _\  /   / / __/_
     /\ \/___/\/_/\   \
    /  \___\    /  \___\
   _\  / __/_  _\  / __/_
  /\ \/_/\   \/\ \/_/\   \
 /  \___\ \___\ \___\ \___\
 \  /   / /   / /   / /itz/
  \/___/\/___/\/___/\/___/
</pre>';
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <head>
      <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
      <title>.: IPtables Analyzer Installation :.</title>
      <style type="text/css">
	body
	{
	    font-family:Verdana, Arial, Helvetica, sans-serif;
	    font-size: 9px;
	    color: #000000;
	    background: #ECF0F8; 
	}
	.field
	{
	   font-family:Verdana, Arial, Helvetica, sans-serif;
	   background:#F3F7FF;
   	   color: #000000;
	   font-size:9px;
	   color:#000000;
	   border-right:#CC3333 1px solid;
	   border-top:#CC3333 1px solid;
	   border-left:#CC3333 1px solid;
	   border-bottom:#CC3333 1px solid;
	   margin-left: 10px;
	}
	.fieldf
	{
	   font-family:Verdana, Arial, Helvetica, sans-serif;
   	   color: #000000;
	   font-size:9px;
	   color:#000000;
	   margin-left: 10px;
	}

	.rleg
	{
	   font-family: Verdana, Arial, Helvetica, sans-serif;
	   font-size: 9px;
	   color:#8B0000;
	   font-weight: bold;
           background: #800000;
           color: #ECF0F8; 
	}
	.content
	{	
	   width: 780px;
	   border-top:#8B0000 1px solid;
	   border-right:#8B0000 1px solid;
	   border-left:#8B0000 1px solid;
	   border-bottom:#8B0000 1px solid;
	}
	h1 
	{
	   font-family:Verdana, Arial, Helvetica, sans-serif;
	   font-size:14px;
	   color:#800000;
	   background: none; 
	   font-weight:bold;
	   text-align: left;
	}
	h2
	{
	   font-family: Verdana, Arial, Helvetica, sans-serif;
	   font-size: 12px;
	   color: #8B0000;
	   background: none; 
	   font-weight: bold;
	   text-align: left;
	}
	.fieldd
	{
	   text-align: left;
	   font-size: 9px;
	   width: 160px;
	}
	.input
	{
	   text-align: left;
	   font-family:Verdana, Arial, Helvetica, sans-serif;
	   background:#F3F7FF;
   	   color: #000000;
	   font-size: 9px;
	   color:#000000;
	   border-right:#8B0000 1px solid;
	   border-top:#8B0000 1px solid;
	   border-left:#8B0000 1px solid;
	   border-bottom:#8B0000 1px solid;
	}
      </style>
      <script type="text/javascript">
   	function rightFocus()
	//puts the cursor to the right place: on host field
	{
	   if(document.forms[0] != null && document.forms[0].name == "settings")
	   {
	     	  document.settings.rootpass.focus();
	   }
        }
      </script>

   </head>
   <body onLoad="rightFocus();">
<?php
if(!isset($_POST['submit']))
{
//if was not submitted, print out the form
?>
       <form action = "<?php echo($_SERVER['PHP_SELF']); ?>" method = "post" name="settings">
	<table class="content" border="0">
	 <tbody>
	  <tr>
	    <td rowspan="3" valign="top">
		<table>
		   <tbody>
		    <tr>
		      <td><h1>IPtables Analyzer Installation</h1></td>
		    </tr>
		    <tr>
		      <td>Make sure exec - function is not disabled on php.ini, since it will be needed for the automatic insertion of database data!</td>
		    </tr>
	    	   </tbody>
		</table>
	     </td>
	  </tr>
          <tr>
	   <td>
              <fieldset>
		 <legend class="rleg">Database information</legend>
		   <table border="0" cellpadding="0" cellspacing="0">
		      <tbody>
			<tr>
            		   <td class="fieldd">host:</td>
            		   <td><input size="30" maxlength="50" class="field" type="text" value="localhost" name="<?php echo($SETUP[0]); ?>"></td>
          		</tr>
          		<tr>
            		   <td class="fieldd">port:</td>
            		   <td><input size="30" maxlength="50" class="field" type="text" value = "3406" name="<?php echo($SETUP[1]); ?>"></td>
          		</tr>
          		<tr>
            		   <td class="fieldd">database to be created:</td>
            		   <td><input size="30" maxlength="50" class="field" type="text" value="iptables" name="<?php echo($SETUP[8]); ?>"></td>
          		</tr>
          		<tr>
            		   <td class="fieldd">mysql root user:</td>
            		   <td><input size="30" maxlength="50" class="field" type="text" value = "root" name="<?php echo($SETUP[6]); ?>"></td>
          		</tr>
			<tr>
	     		   <td class="fieldd">mysql root user's password:</td>
	     		   <td><input size="30" maxlength="50" class="field" type="password" name="<?php echo($SETUP[7]); ?>"></td>
			</tr>
		      </tbody>
		   </table>
	      </fieldset>
	      <br />
              <fieldset>
		 <legend class="rleg">User information</legend>
		   <table border="0" cellpadding="0" cellspacing="0">
		      <tbody>
			<tr>
            		   <td class="fieldd">admin:</td>
            		   <td><input size="30" maxlength="50" class="field" type="text" value="ipadmin" name="<?php echo($SETUP[2]); ?>"></td>
          		</tr>
          		<tr>
            		   <td class="fieldd">admin\'s password:</td>
            		   <td><input size="30" maxlength="50" class="field" type="password" value = "1234" name="<?php echo($SETUP[3]); ?>"></td>
			   <td class="fieldf">(1234)</td>
          		</tr>
          		<tr>
            		   <td class="fieldd">user:</td>
            		   <td><input size="30" maxlength="50" class="field" type="text" value="ipuser" name="<?php echo($SETUP[4]); ?>"></td>
          		</tr>
          		<tr>
            		   <td class="fieldd">user\'s password:</td>
            		   <td><input size="30" maxlength="50" class="field" type="password" value = "1234" name="<?php echo($SETUP[5]); ?>"></td>
			   <td class="fieldf">(1234)</td>
          		</tr>
		      </tbody>
		   </table>
	      </fieldset>
	      <br />
              <fieldset>
		 <legend class="rleg">General information</legend>
		   <table border="0" cellpadding="0" cellspacing="0">
		      <tbody>
			<tr>
			  <td class="fieldd">access folder on server:</td>
            		  <td><input size="30" maxlength="50" class="field" type="text" value="/iptables/" name="<?php echo($SETUP[9]); ?>"></td>
			  <td class="fieldf">(result is http://yourhost/iptables/)</td>
          		</tr>
          		<tr>
            		  <td class="fieldd">location of the log file:</td>
            		  <td><input size="30" maxlength="50" class="field" type="text" value="/var/log/iptables.log" name="<?php echo($SETUP[10]); ?>" /></td>
          		</tr>
		      </tbody>
		   </table>
	     </fieldset>
	</td>
      </tr>
      <tr>
	<td rowspan="3"><input class="input" type="submit" name="submit" value="Install!"></td>
      </tr>
      </tbody>
     </table>
    </form>;
<?php
}
else
//form was submitted
{
    if(!isAllSet())
    //all the fields were not set
    {
	    echo($NOTOK.'<br />You had some empty text fields!<br /><a href="./install.php">back</a>');
    }
    else 
    {
        //getting the values
        $DBNAME = trim($_POST[$SETUP[8]]);
        $USER = trim($_POST[$SETUP[6]]);
        $PASS = trim($_POST[$SETUP[7]]);
        $HOST = trim($_POST[$SETUP[0]]);
        $PORT = trim($_POST[$SETUP[1]]);
        $IPADMIN = trim($_POST[$SETUP[2]]);
        $IPUSER = trim($_POST[$SETUP[4]]);
        $IPADMINPASS = trim($_POST[$SETUP[3]]);
        $IPUSERPASS = trim($_POST[$SETUP[5]]);
        $LOGFILE = trim($_POST[$SETUP[10]]);
        $URLBASE = trim($_POST[$SETUP[9]]);

        $link = mysql_connect($HOST,$USER,$PASS) or die("Mysql error occured: ".mysql_error());
	//if not connected, call the page self with error message

        //creating database and users and granting rights
	$queries = array('create database iptables;',
			 "grant create,select,insert on iptables.* to '$IPADMIN'@'$HOST' identified by '$IPADMINPASS';",
			 "grant select on iptables.* to '$IPUSER'@'$HOST' identified by '$IPUSERPASS';",
			 "grant create temporary tables on iptables.* to '$IPUSER'@'$HOST' identified by '$IPUSERPASS';");
	for($i = 0; $i < count($queries); $i++)
	     mysql_query($queries[$i],$link) or die('Error occured: '.mysql_error());

	exec("cat sql/db.sql | mysql $DBNAME -u$IPADMIN -p$IPADMINPASS");

    	//editing config.php and feed_db.php - thanks cactus and other guys of Arch forums :)
	$conf = 'config.php';
	$match= array('/^([ ]*)\$db_host.*$/m',
	              '/^([ ]*)\$db_user.*$/m',
		      '/^([ ]*)\$db_password.*$/m',
		      '/^([ ]*)\$db_name.*$/m',
		      '/^([ ]*)\$url_base.*$/m');


	$replace= array('${1}$db_host="'.$HOST.'";',
	                '${1}$db_user="'.$IPUSER.'";',
	                '${1}$db_password="'.$IPUSERPASS.'";',
			'${1}$db_name="'.$DBNAME.'";',
			'${1}$url_base="'.$URLBASE.'";');
        $file = preg_replace($match,$replace,file_get_contents($conf));
	file_put_contents ($conf, $file);
	
	//usr/bin/feed_db.pl
	$pl = '/usr/bin/feed_db.pl';
	$match = array('/^([ ]*)my.\$dsn.*$/m',
		       '/^([ ]*)my.\$db_user_name.*$/m',
		       '/^([ ]*)my.\$db_password.*$/m',
		       '/^([ ]*)my.\$log_file.*$/m');
	$replace = array('${1}my $dsn="DBI:mysql:'.$DBNAME.':'.$HOST.'";',
			 '${1}my $db_user_name="'.$IPADMIN.'";',
			 '${1}my $db_password="'.$IPADMINPASS.'";',
			 '${1}my $log_file="'.$LOGFILE.'";');
	$file = preg_replace($match,$replace,file_get_contents($pl));
	file_put_contents ($pl, $file);
        echo($OK.'<br />Now start the daemon (/etc/rc.d/iptlogd start)
    	      and <br /><a href="./">watch the logs</a>!');
    }
?>
<?php
}
?>
</body>
</html>
<?php
ob_end_flush();
?>
