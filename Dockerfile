FROM centos:9

RUN  yum install httpd -y 
CMD tail -f /dev/null
