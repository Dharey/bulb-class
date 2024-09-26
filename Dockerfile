# FROM centos:9

# RUN  yum install httpd -y 
# CMD tail -f /dev/null

FROM centos/httpd-24-centos7

CMD tail -f /dev/null

