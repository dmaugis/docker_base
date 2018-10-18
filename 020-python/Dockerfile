FROM dmaugis/qt5

COPY install-python.sh /tmp/
RUN  /tmp/install-python.sh  
RUN  rm /tmp/install-python.sh
ADD  info.py info.py
ENV  PATH=/root/.pyenv/plugins/pyenv-virtualenv/shims:/root/.pyenv/shims:/root/.pyenv/bin:$PATH
CMD ["./info.py"]
#CMD ["env"]


