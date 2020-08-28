#!/bin/bash

# Source Information
# https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/installation.md
# https://github.com/dusty-nv/jetson-containers/blob/master/Dockerfile.ml
# https://docs.nvidia.com/deeplearning/frameworks/install-tf-jetson-platform/index.html


# Install Tensorflow APT Dependencies
sudo apt-get update
sudo apt-get install -y \
        build-essential \
        libssl-dev \
        libffi-dev \
        python3-dev \
        libfreetype6-dev \
        openmpi-bin \
        openmpi-common \
	protobuf-compiler \
        libprotoc-dev \
        python3-venv \
        libhdf5-serial-dev \
        hdf5-tools \
        libhdf5-dev \
        zlib1g-dev \
        zip \
        libjpeg8-dev \
        liblapack-dev \
        libblas-dev \
        gfortran \
        libfreetype6-dev \


# Create and Activate New Python Virtual ENV
cd /home/mvacanti/venv/ || mkdir /home/mvacanti/venv/
python3 -m venv ML3 --system-site-packages
source ML3/bin/activate

# Install Tensorflow Python Dependencies
python3 -m pip install --upgrade pip
pip3 install testresources
pip3 install setuptools
pip3 install numpy
pip3 install grpcio
pip3 install absl-py
pip3 install py-cpuinfo
pip3 install psutil
pip3 install portpicker
pip3 install six
pip3 install mock
pip3 install requests
pip3 install gast
pip3 install h5py
pip3 install astor
pip3 install termcolor
pip3 install protobuf
pip3 install keras-applications
pip3 install keras-preprocessing
pip3 install wrapt
pip3 install google-pasta
pip3 install Cython
pip3 install contextlib2
pip3 install Pillow
pip3 install lxml
pip3 install jupyter
pip3 install matplotlib
pip3 install tf_slim
pip3 install tensorboard==1.15.0
pip3 install tensorflow-estimator==1.15.1

#Install Tensorflow
pip3 install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow==1.15.2+nv20.04

# Install Tensorflow Models
cd ML3 || exit
mkdir tensorflow
cd tensorflow || exit
git clone https://github.com/tensorflow/models.git -b r1.13.0
cd models/research || exit
protoc object_detection/protos/*.proto --python_out=.


