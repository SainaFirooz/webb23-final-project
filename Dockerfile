# vi använder Python image version 3.10 i en slim variant
# bilden är optimerad för att vara liten och innehåller bara det mest nödvändiga
FROM python:3.10-slim

# skapar en working directory som heter /app inuti containern
# alla följande kommandon kommer att köras i den här mappen
WORKDIR /app

# kopierar filen requirements.txt till /app mappen i containern
# . refererar till /app mappen
COPY . .

# kör pip install för att installera alla nödvändiga Python paket som specificeras i requirements.txt
RUN pip install -r requirements.txt 

# containern kommer att lyssna på port 8000 vid körning
EXPOSE 8000

# kommandot för att köra Django servern
CMD ["python", "blog_project/manage.py", "runserver", "0.0.0.0:8000"]
