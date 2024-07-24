# basic python3 image as base
FROM harbor2.vantage6.ai/infrastructure/algorithm-base

# This is a placeholder that should be overloaded by invoking
# docker build with '--build-arg PKG_NAME=...'
ARG PKG_NAME="v6-csv-extractor-py"
ARG INSTALL_DEV=false

# install federated algorithm
COPY ./v6-csv-extractor-py/ /app
RUN pip install /app

COPY ./vantage6 /app/vantage6
RUN pip install /app/vantage6/vantage6
RUN pip install /app/vantage6/vantage6-common
RUN pip install /app/vantage6/vantage6-algorithm-tools

# Set environment variable to make name of the package available within the
# docker image.
ENV PKG_NAME=${PKG_NAME}

# Tell docker to execute `wrap_algorithm()` when the image is run. This function
# will ensure that the algorithm method is called properly.
CMD python -c "from vantage6.algorithm.tools.wrap import wrap_algorithm; wrap_algorithm()"
