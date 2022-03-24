# Project 5

## Part 1

### Project Overview 

### Run Project Locally

- How you installed docker + dependencies

  Downloaded docker desktop. Went to terminal and changed from WSL1 to WSL2 with these commands:
 
      wsl.exe -l -v
  
      wsl.exe --set-version Ubuntu-18.04 2
  
      wsl.exe --set-default-version 2
  
      wsl.exe --set-default Ubuntu-18.04
      
    Note: Took some time for Ubuntu to change from WSL1 to WSL2.
  
  After making sure the dependecie was WSL2 went to Docker Desktop and made sure WSL2 was checked off. Also, go to Refrences tab and click on WSL       Integration. Make sure on the WSL Integration that you checked on WSL2 enbaled and made sure Ubuntu-18.04 was checked off as well.
  
- How to build the container
  Create a file called Dockerfile. Add this code to Dockerfile:
   
      FROM nginx:alpine

      WORKDIR /usr/share/nginx/html

      RUN rm -rf ./*

      COPY ./* ./

      ENTRYPOINT ["nginx", "-g", "daemon off;"]
    
   After creating Dockerfile. Create an image using docker build -t static-nginx. 
  
- How to run the container

  To run the container after you create the image:
      docker run --rm -it -p 8080:80 static-nginx

- How to view the project (open a browser go to ip and port)

  To view website on browser. Type into browser localhost/8000
  
  Proof of website running: 
  
  ![Screenshot 2022-03-24 133835](https://user-images.githubusercontent.com/56359938/159977845-44c08ab0-191c-4627-8c27-f0d873cab4b9.png)

