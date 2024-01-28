# syntax=docker/dockerfile:1
#use python3.9 docker image
FROM python:3.9-slim-buster
#this is dicrectory within container which will be used for further operations
WORKDIR /app
#copy the local working directorry contents into container working directory
COPY . .
COPY ./requirements.txt requirements.txt
#verify contents
RUN ls
#install dependencies to be used by image
RUN pip install -r requirements.txt
#Train and save the model
RUN python code_model_training/train.py
EXPOSE 5000
#run the application on port 5000
CMD ["flask", "run", "-p", "5000"]
