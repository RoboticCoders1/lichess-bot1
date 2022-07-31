FROM ubuntu:jammy
COPY . .

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget unzip python3 python3-pip p7zip

RUN mv config.yml.default config.yml
RUN wget "https://github.com/ianfab/Fairy-Stockfish/releases/latest/download/fairy-stockfish_x86-64-bmi2" -O fsf
RUN mv fsf_* engines/fsf && chmod +x engines/fsf

RUN wget --no-check-certificate -nv "https://drive.google.com/u/0/uc?id=1r5o5jboZRqND8picxuAbA0VXXMJM1HuS&export=download" -O 3check.nnue
RUN mv 3check.nnue_* engines/3check.nnue 

RUN wget --no-check-certificate -nv "https://drive.google.com/u/0/uc?id=14CYA7qV1Jsh5g-lpg46-tz9Whp8zN0aI&export=download" -O atomic.nnue
RUN mv atomic.nnue_* engines/atomic.nnue

RUN wget --no-check-certificate -nv "https://drive.google.com/u/0/uc?id=168vawXrj2fEeRSLuWaL2pB7GXgQelE-c&export=download" -O crazyhouse.nnue
RUN mv crazyhouse.nnue_* engines/crazyhouse.nnue

RUN wget --no-check-certificate -nv "https://drive.google.com/u/0/uc?id=16BQztGqFIS1n_dYtmdfFVE2EexF-KagX&export=download" -O horde.nnue
RUN mv horde.nnue_* engines/horde.nnue

RUN wget --no-check-certificate -nv "https://drive.google.com/u/0/uc?id=1x25r_1PgB5XqttkfR494M4rseiIm0BAV&export=download" -O kingofthehill.nnue
RUN mv kingofthehill.nnue_* engines/kingofthehill.nnue

RUN wget --no-check-certificate -nv "https://drive.google.com/u/0/uc?id=1x25r_1PgB5XqttkfR494M4rseiIm0BAV&export=download" -O racingking.nnue
RUN mv racingkings.nnue_* engines/racingkings.

RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Add the "--matchmaking" flag to start the matchmaking mode.
CMD python3 lichess-bot.py -u
