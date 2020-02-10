FROM python:3

COPY ./requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY ./copy_files.py .

ENTRYPOINT ["python", "./copy_files.py"]
