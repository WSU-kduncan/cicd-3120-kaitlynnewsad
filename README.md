# Project 5



### Project Overview 

## Part 1

- How you installed docker + dependencies

  Downloaded docker desktop. Went to terminal and changed from WSL1 to WSL2 with these commands:
 
      wsl.exe -l -v
  
      wsl.exe --set-version Ubuntu-18.04 2
  
      wsl.exe --set-default-version 2
  
      wsl.exe --set-default Ubuntu-18.04
      
    Note: Took some time for Ubuntu to change from WSL1 to WSL2.
  
  After making sure the dependecie was WSL2 went to Docker Desktop and made sure WSL2 was checked off. Also, go to Refrences tab and click on WSL Integration.
  
  Make sure on the WSL Integration that you checked on WSL2 enbaled and made sure Ubuntu-18.04 was checked off as well.
  
- How to build the container
  Create a file called Dockerfile. Add this code to Dockerfile:
   
      FROM nginx:alpine

      WORKDIR /usr/share/nginx/html

      RUN rm -rf ./*

      COPY ./* ./

      ENTRYPOINT ["nginx", "-g", "daemon off;"]
    
   After creating Dockerfile. Create an image using this command: 
   
        docker build -t static-nginx . 
  
- How to run the container

  To run the container after you create the image:
  
        docker run --rm -it -p 8080:80 static-nginx

- How to view the project (open a browser go to ip and port)

  To view website on browser. Type into browser localhost:8000
  
  Proof of website running: 
  
  ![Screenshot 2022-03-24 133835](https://user-images.githubusercontent.com/56359938/159978541-7a28b342-98c8-4089-96b2-59732ccc1805.png)
  
  ## Part 2
  
 - Create DockerHub public repo. Process to create repo.
 
      Go to Dockerhub in browser. Sign into your DockerHub accountant. Then click on Repositories and click on the button "Create Repositories" Name the      repository project name and make sure you clicked on public. 
      
    Add image created above to this repo we have created using these commands:
    
            docker login -u <"your-username"> -p <"your-docker-password"> docker.io
    
            docker tag static-nginx kaitlynnewsad/project-5:lastest
            
            docker push kaitlynnewsad/project-5:lastest
    


- Allow DockerHub authentication via CLI Dockerhub credentials
 
     Go to settings and click on secuurity. Hit on the button "New Access Token", Nmae the token and and pur read, write, delete for the scope. After creating the token save the key in a notepad document. 

 - Configure GitHub secrets
      - what credentials are needed - DockerHub credential
     
      You need to have your docker key you created that you have stored in your notepad doc.
      
     
      - set secrets and secret names
      
        Create one secret called DOCKER_USERNAME with your docker username.
        
        Create another secret called DOCKER_PASSSWORD with the string of letters of numbers that was the key your created.

 - Configure Github Workflow. Variables to change
 
    Change the varibles for Docker username and Docker password to the ones your created in GitHub secrets.
    

## Part 3
Clone Github repo to remote ubuntu that you ssh into. 

Install both docker and webnook onto remote system. 

To create webnook on Docker. Got to repo for project clikc on webnook names project and create a URL that uses the 
same public IP address as remote system. Example: https://IP-address:9000/hooks/redeploy

Create two files:

  - redeploy.json : hook config file. 
  - pull-restart.sh : script that will call config file

- Container restart script
    - What it does?
    
      The script will ill any other version old versions of the container. 
      Will also kill any unused containers or images.
      Will get updated images and run the container on poer 80.

- Webnook task defintion file
    - What it does?
    
      Will define the files the webnok needs to call.
      Will use the webnook you created in docker and will use that id to call the server.
      Will call on the script called push-restart.
      If succesfully done the webnook will print a message.

- Seeting up a webnook on the server

    - How you created you own listener?
    
                    sudo ./pull-restart.sh -hooks redeploy.json
                    
                    webnook -hooks path/to/webnook-config.json -verbose
                
    - How you installed and are running the webnook on Github?
    
      I installed webnook on using sudo apt-get insall webnook and using the link from github. 
      Also used this guide on github: https://github.com/adnanh/webhook
      Made changes to my index.html to make sure the webnook was running on Github. 
      
   - Setting up a notifier in GitHub or DockerHub
   
      I set up to be notified in Github my going to settings in this repo and going to the webnooks tab.
      I entered the url I made for Dockerhub and put notify me on everything. 

## Part 4
- Diagram 

![Untitled Diagram drawio (1)](https://user-images.githubusercontent.com/56359938/164463783-86b80477-5956-4652-8d2a-f99dc471e855.png)


