# see https://github.com/conda-incubator/conda-libmamba-solver
FROM condaforge/miniforge3

RUN apt-get update && apt-get install -y git wget gcc
RUN git clone --depth 1 https://gitlab.in2p3.fr/gammalearn/gammalearn

RUN conda env update -f gammalearn/environment.yml -n base

RUN cd gammalearn; pip install .; cd ..

RUN conda clean -a

CMD bash
