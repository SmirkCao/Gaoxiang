FROM ubuntu:16.04
RUN apt-get -y update && \
    apt-get -y install \
	apt-utils \
        python3 \
	python3-dev \
	git \
	wget \
	unzip \
	cmake \
	build-essential \
	pkg-config \
	libatlas-base-dev \
	libjasper-dev \
        libgtk2.0-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libv4l-dev \ 
	vim &&\

    wget https://github.com/opencv/opencv/archive/3.4.2.zip -O opencv3.zip && \
    unzip -q opencv3.zip && \
    mv /opencv-3.4.2 /opencv && \
    rm opencv3.zip && \
    wget https://github.com/opencv/opencv_contrib/archive/3.4.2.zip -O opencv_contrib3.zip && \
    unzip -q opencv_contrib3.zip && \
    mv /opencv_contrib-3.4.2 /opencv_contrib && \
    rm opencv_contrib3.zip &&\
  

    mkdir /opencv/build && cd /opencv/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D BUILD_PYTHON_SUPPORT=ON \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
      -D BUILD_EXAMPLES=OFF \
      -D PYTHON_DEFAULT_EXECUTABLE=/usr/bin/python3 \
      -D BUILD_opencv_python3=ON \
      -D BUILD_opencv_python2=OFF \
      -D WITH_IPP=OFF \
      -D WITH_FFMPEG=ON \
      -D WITH_V4L=ON .. \
      && \
    cd /opencv/build && \
    make -j4 && \
    make install && \
    ldconfig 
    
CMD ["python --version"]
