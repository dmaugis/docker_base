FROM dmaugis/ceres1

COPY install-python.sh /tmp/
RUN  /tmp/install-python.sh  
RUN  rm /tmp/install-python.sh
ADD  info.py info.py
ADD  info.sh info.sh
ENV  PATH=/root/.pyenv/plugins/pyenv-virtualenv/shims:/root/.pyenv/shims:/root/.pyenv/bin:$PATH
CMD ["./info.sh"]
#CMD ["env"]


