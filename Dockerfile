FROM ubuntu 
MAINTAINER logiclabs 

RUN apt-get update 
RUN apt-get install –y git 
CMD [“echo”,”Image created”] 
