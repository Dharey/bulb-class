# FROM centos:7

# RUN  yum install httpd -y 
# CMD tail -f /dev/null

FROM centos:7
RUN sed -i 's|mirrorlist=http://mirrorlist.centos.org|#mirrorlist=http://mirrorlist.centos.org|' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://mirror.centos.org|' /etc/yum.repos.d/CentOS-Base.repo && \
    yum install httpd -y
CMD tail -f /dev/null
