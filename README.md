### This is and simple bash script to restart your miner every time your rigs or gpus are not hashing. When your rig is in a state whre the miner cannot be restarted, the script will identify that and reboot the rig.


* Place the files "jobs.txt", "miner_restarter.sh" and "rig_restarter.sh" into your "/home/ethos" folder

* Open a terminal and run: 
	
	- chmod 775 /home/ethos/miner_restarter.sh
	- chmod 775 /home/ethos/rig_restarter.sh
	- crontab jobs.txt

* Enjoy
