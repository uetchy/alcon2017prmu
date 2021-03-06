FROM bvlc/caffe:cpu

MAINTAINER kawanishi

RUN apt update
RUN apt install -y wget cmake libboost-all-dev
RUN apt install -y python3 python3-pip libpython3-dev libpython-dev

# python install
RUN pip install numpy scipy ipython scikit-learn scikit-image matplotlib opencv tensorflow keras chainer theano
RUN pip3 install numpy scipy ipython scikit-learn scikit-image matplotlib opencv tensorflow keras chainer theano

# opencv install
RUN apt install -y libopencv-dev
RUN apt remove -y libopencv-dev
RUN wget -O opencv-3.2.0.tar.gz https://github.com/opencv/opencv/archive/3.2.0.tar.gz
RUN tar zxvf opencv-3.2.0.tar.gz
RUN cd opencv-3.2.0 && mkdir build && cd build && cmake .. && make -j8 && make install
RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf
RUN ldconfig

WORKDIR /alcon
