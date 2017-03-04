FROM jupyter/datascience-notebook

USER root

RUN apt-get update && \
  apt-get install -y libzmq3 libzmq3-dev


USER $NB_USER

#RUN pip3 install -U pip
#RUN pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip3 install -U
#RUN pip3 install -U jupyter

RUN cd $CONDA_DIR/share && \
    git clone https://github.com/notablemind/jupyter-nodejs.git
RUN cd $CONDA_DIR/share/jupyter-nodejs && \
    npm install && \
    npm run build && \
    npm run build-ext
RUN cd $CONDA_DIR/share/jupyter-nodejs && \
    mkdir -p $CONDA_DIR/share/jupyter/kernels/nodejs && \
    node install.js $CONDA_DIR/share/jupyter/kernels/nodejs

