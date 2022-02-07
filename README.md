1. create a folder named e.g. radiostation
2. open your terminal or powershell an go to the new folder
3. clone this repository or copy all files in it
4. make the install_all.sh and uninstall_all.sh files executable
5. run the script install_all.sh
6. if you need changed for ports, volumenames or containernames uninstall all containers with uninstall_all.sh script an make sure, that all needed changes sucessfully done in the docker-compose.yml files. 

after setting up the services jump into the container icecast with command "docker exec -it icecast /bin/bash" an go to folder /etc/icecast2
open the file icecast2.xml ad setup your setting for icecast2 frontend
now change to the folder /home/radio/webradio and open the file radio.liq
insert your login informations for icecast

restart after finish your changes icecast container with command "docker restart icecast"
open the application in your browser
also open telerix in your browser and configure your sipgate and tream settings
also open the website frontend and build your website with wordpress
