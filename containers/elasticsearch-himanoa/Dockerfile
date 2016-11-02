FROM elasticsearch:2

RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin install analysis-kuromoji
RUN /etc/init.d/elasticsearch restart
