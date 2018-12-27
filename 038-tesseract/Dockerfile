FROM dmaugis/cgal4	

# install opencv3.4.2.sh
COPY install-tesseract.sh /tmp/
RUN  /tmp/install-tesseract.sh  
RUN  rm /tmp/install-tesseract.sh
#CMD  ["tesseract","-v"]
RUN  env
ADD  info.py info.py
ADD  info.sh info.sh
CMD  ["bash","info.sh"]



