#Use the official Python image from the Docker Hub
FROM python:3.10-slim

#Set the working directory inside the container
# creates a folder called app in the container
WORKDIR /app

#Copy the requirements file into the container
# Same as package.json for python
# . means copy the file from the current directory
COPY requirements.txt .

#Install the dependencies
# Same as npm install for python
# read requirements.txt and install all the dependencies
RUN pip install -r requirements.txt 

#Copy the entire project into the container
COPY . .

#Expose the port the app runs on
EXPOSE 8000

#Command to run the Django server
CMD ["python", "blog_project/manage.py", "runserver", "0.0.0.0:8000"]
