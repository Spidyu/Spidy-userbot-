FROM kyyex/kyy-userbot:busterv2
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    ffmpeg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
RUN git clone -b spidy-userbot- https://github.com/Spidyu/spidy-userbot- /home/spidy-userbot-/ \
    && chmod 777 /home/spidy-userbot- \
    && mkdir /home/spidy-userbot-/bin/
WORKDIR /home/spidy-userbot-/
COPY ./sample_config.env ./config.env* /home/spidy-userbot-/
RUN pip install -r requirements.txt
CMD ["python3", "-m", "userbot"]
