FROM centos:7


RUN yum install -y wget && wget https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_linux-x64_bin.tar.gz  && tar -zxvf openjdk-14.0.1_linux-x64_bin.tar.gz \
	&& mv jdk-14.0.1 /opt/jdk &&echo JAVA_HOME=/opt/jdk/ >>  /etc/profile && echo  JAVA_BIN=/opt/jdk/bin >>  /etc/profile && echo  JRE_HOME=/opt/jdk/jre >> /etc/profile && echo  CLASSPATH=/opt/jdk/jre/lib:/opt/jdk/lib:/opt/jdk/jre/lib/charsets.jar >> /etc/profile \
	&& echo  export  JAVA_HOME  JAVA_BIN JRE_HOME  PATH  CLASSPATH >> /etc/profile && source /etc/profile && echo  export JAVA_HOME=/opt/jdk >>  ~/.bashrc && echo  export PATH=$JAVA_HOME/bin:$PATH >>  ~/.bashrc \
	&& echo  export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar >> /etc/profile && source ~/.bashrc


WORKDIR ~

RUN wget https://downloads.lightbend.com/scala/2.13.2/scala-2.13.2.tgz  && tar -zxvf  scala-2.13.2.tgz && mv scala-2.13.2 /usr/local/share/scala  && echo export PATH="$PATH:/usr/local/share/scala/bin" >>  /etc/profile

# CMD ["java","-version"]	
