FROM centos

LABEL AUTHOR="MOHIT BHATT"

RUN yum install git python2 -y
RUN git clone https://github.com/imohitbhatt/notejam.git

WORKDIR /notejam/django

RUN pip2 install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt 
RUN python2 ./notejam/manage.py syncdb --noinput
RUN python2 ./notejam/manage.py migrate

EXPOSE 8000

CMD ["python2", "./notejam/manage.py", "runserver", "0.0.0.0:8000"]

