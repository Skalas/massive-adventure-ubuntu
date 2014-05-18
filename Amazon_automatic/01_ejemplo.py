# coding:utf-8
# 09-abril-2014

# Para clase de Adolfo
# Prender una máquina y picarle

import os
import time
import boto
import boto.manage.cmdshell
import boto.ec2
# Queremos bajar los archivos con scp...
import commands
import datetime
# Manejo de parámetros desde la línea de comandos
import argparse



#Habia errores raros; solucionados modificando esto:
#/Users/PandoraMac/anaconda/python.app/Contents/lib/python2.7/site-packages/paramiko/client.py 
# ami-7341831a la que sirve 825ea7eb 83e4bcea
# ubuntu: ami-a73264ce 
# jessy_gizzy@hotmail.com
# def launch_instance(ami='ami-83e4bcea',
# 					instance_type='t1.micro', 
# 					key_name='cruz_roja', 
# 					key_extension='.pem', 
# 					key_dir='/Users/PandoraMac/Documents', 
# 					group_name='cruz_roja', 
# 					ssh_port=22, 
# 					cidr='0.0.0.0/0', 
# 					tag='ubun1', 
# 					user_data='', 
# 					cmd_shell=True, 
# 					login_user='ec2-user', 
# 					ssh_passwd=None):
def launch_instance(ami='ami-c6402cf6',
					instance_type='t1.micro', 
					key_name='miguel', 
					key_extension='.pem', 
					key_dir='/home/skalas/.ssh/', 
					group_name='Postgresql', 
					ssh_port=22, 
					cidr='0.0.0.0/0', 
					tag='cruz', 
					user_data='', 
					cmd_shell=True, 
					login_user='ubuntu', 
					ssh_passwd=None):
	# Launch an instance and wait for it to start running.
	# Returns a tuple consisting of the Instance object and the CmdShell object, if request, or None.
	# ami The ID of the Amazon Machine Image that this instance will be based on. Default is a 64-bit Amazon Linux EBS image.
	# instance_type The type of the instance.
	# key_name The name of the SSH Key used for logging into the instance. It will be created if it does not exist.
	# key_extension The file extension for SSH private key files.
	# key_dir group_name
	# ssh_port cidr
	# tag
	# user_data
	# cmd_shell 
	# login_user
	# ssh_passwd The password for your SSH key if it is encrypted with a passphrase. 


	cmd = None
	# Create a connection to EC2 service.
	# You can pass credentials in to the connect_ec2 method explicitly
	# or you can use the default credentials in your ~/.boto config file # as we are doing here.
	# hotmail	
	#gmail
	ec2 =boto.ec2.connect_to_region("us-west-2", aws_access_key_id='AKIAIHV2MQMBNJBQGMEA', aws_secret_access_key='nO+Ku3ZDzH1CQr0Vynti5436nF+mLd28Dns4i47s')
        
	# Check to see if specified keypair already exists.
	# If we get an InvalidKeyPair.NotFound error back from EC2,
	# it means that it doesn't exist and we need to create it. 
	try:
		key = ec2.get_all_key_pairs(keynames=[key_name])[0] 
	except ec2.ResponseError, e:
		if e.code == 'InvalidKeyPair.NotFound': 
			print 'Creating keypair: %s' % key_name
	# Create an SSH key to use when logging into instances. 
			key = ec2.create_key_pair(key_name)
	# AWS will store the public key but the private key is
	# generated and returned and needs to be stored locally.
	# The save method will also chmod the file to protect # your private key.
			key.save(key_dir)
		else: 
			raise
	# Check to see if specified security group already exists. 
	# If we get an InvalidGroup.NotFound error back from EC2, 
	# it means that it doesn't exist and we need to create it. 
	try:
		group = ec2.get_all_security_groups(groupnames=[group_name])[0] 
	except ec2.ResponseError, e:
		if e.code == 'InvalidGroup.NotFound':
			print 'Creating Security Group: %s' % group_name
	# Create a security group to control access to instance via SSH. 
			group = ec2.create_security_group(group_name,'A group that allows SSH access')
		else: 
			raise

	# Add a rule to the security group to authorize SSH traffic
	# on the specified port. 
	try:
		group.authorize('tcp', ssh_port, ssh_port, cidr) 
	except ec2.ResponseError, e:
		if e.code == 'InvalidPermission.Duplicate':
			print 'Security Group: %s already authorized' % group_name
		else: 
			raise
	# Now start up the instance. The run_instances method # has many, many parameters but these are all we need # for now.
	reservation = ec2.run_instances(ami,
                                        key_name=key_name, 
                                        security_groups=[group_name],
                                        instance_type=instance_type) 
        # user_data=script)
        
	# Find the actual Instance object inside the Reservation object # returned by EC2.
	instance = reservation.instances[0]
	# The instance has been launched but it's not yet up and
	# running. Let's wait for its state to change to 'running'.
	print 'waiting for instance'
	# while instance.state != 'running': 
	# 	#print '.'
	# 	time.sleep(45)
	# 	instance.update() 
	while instance.update() == "pending":
		time.sleep( 25 )
		print "."
	print 'Instance is now running'
	# time.sleep(120)
    #print 'Instance IP is %s' % instance.ip_address
	# Let's tag the instance with the specified label so we can
	# identify it later. 
	# instance.add_tag(tag)
	# The instance is now running, let's try to programmatically 
	# SSH to the instance using Paramiko via boto CmdShell.
	if cmd_shell:
		key_path = os.path.join(os.path.expanduser(key_dir), key_name+key_extension)
		cmd = boto.manage.cmdshell.sshclient_from_instance(instance, key_path, user_name=login_user)
	return (instance, cmd)

start_time = datetime.datetime.now()

print "\n-------------------------------------"
print "Iniciando: "+ str(start_time)

instance, cmdshell = launch_instance()#user_data=script)

#Para ver si está funcionando
cmdshell.shell() #me da el shell de la instancia, sin tener que hacer más cosas!

# Para matarla!
# instance.terminate()


# print "Instance terminated"




#Notitas:

# sudo easy_install boto
# sudo easy_install paramiko

# - Download and extract the Euca2ools tar file from http://downloads.eucalyptus.com/software/euca2ools/3.0/source/euca2ools-3.0.0.tar.gz

# - Switch to the directory where you extracted the Euca2ools tar file and install Euca2ools using the following command.
# sudo python setup.py install

# - Type the following command to verify Euca2ools installed properly:
# euca-version

# - This command should return output similar to the following:
# euca2ools 3.0.0 (Sparta)

# #Hubo un errorsín de permisos... pero ya lo solucioné y ya sale eso.


# Para AWS necesiamos tener listas las credenciales

# AWS Account Credentials: email & psswd
# AWS Account Number: 2561-7416-0126 
# AccessKeyID: AKIAIKOJRMO3MX7CAYXA 
# SecretAccessKey: QTNZx4Kdf8BWsmMonMPg4dft8w2Z9JHXWo5Jdufx (las busqué en la consola de amazon)
# X.509 Certificate You can provide your own certificate or you can have AWS generate a certificate for you. 

# En boto, hay que pasar credentials.
# >>> import boto
# >>> ec2 = boto.connect_ec2(aws_access_key_id='AKIAIKOJRMO3MX7CAYXA', aws_secret_access_key='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')

# O bien, ponerlas en variables o en el boto config file: /etc/boto.cfg and in ~/.boto


# SSH Keys.  SSH keypairs can be generated via the AWS Console and API, or you can import existing keypairs

# $ ssh-keygen -t rsa -b 1024
# Generating public/private rsa key pair.
# Enter file in which to save the key (/Users/PandoraMac/.ssh/id_rsa): pandora.pem
# Enter passphrase (empty for no passphrase): 
# Enter same passphrase again: 
# Your identification has been saved in pandora.pem.
# Your public key has been saved in pandora.pem.pub.

# You have an existing SSH keypair and you would prefer to use that for accessing in- stances rather than create a new keypair.
#Al final opté por crear una llave nueva dsd la consola de amazon y bajarla a la compu


# ssh-keygen -e -f pandora.pem > pandora.pub

# import boto
# >>> ec2 = boto.connect_ec2(aws_access_key_id='AKIAIKOJRMO3MX7CAYXA', aws_secret_access_key='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')
# >>> fp=open('pandora.pem.pub')
# >>> material=fp.read()
# >>> fp.close()
# >>> key_pair=ec2.import_key_pair('pandora.pem',material)


# # Use the get_console_output method to view the console log of the instance to trouble- shoot the problem.

# import boto
# ec2 = boto.connect_ec2(aws_access_key_id='AKIAIKOJRMO3MX7CAYXA', aws_secret_access_key='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')
# instance = ec2.get_all_instances()[0].instances[0]
# co = instance.get_console_output() 
# print co.output


#2.15
# #You need to run custom scripts each time a new instance is started.
# pass a shell script as user-data when the instance is launched, and the shell script will be executed as root on the instance at launch.



# Y recordemos que, desde la consola:

# ssh -i cruz_roja.pem ubuntu@ec2-54-221-11-181.compute-1.amazonaws.com
