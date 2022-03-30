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
    
            docker tag static-ngix kaitlynnewsad/project-5:1.0
            
            docker push kaitlynnewsad/project-5:1.0
    


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
    
    Change the last tag on the bottom to the name of your image. Mine was static-nginx.

## Part 3

- Creating a webhook.


## Extra Credit 

- Image of Project/ Docker pull command

- How to run he container image


