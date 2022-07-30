FROM ubuntu:jammy
COPY . .

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget unzip python3 python3-pip p7zip

RUN mv config.yml.default config.yml
RUN wget "https://github.com/ianfab/Fairy-Stockfish/releases/download/fairy_sf_14_0_1_xq/fairy-stockfish-largeboard_x86-64-bmi2" -O fsf
RUN mv fsf* engines/fsf && chmod +x engines/fsf

RUN wget --no-check-certificate "https://drive.google.com/u/0/uc?id=1r5o5jboZRqND8picxuAbA0VXXMJM1HuS&export=download" -O 3check-313cc226a173.nnue
RUN mv 3check-313cc226a173.nnue* engines/3check-313cc226a173.nnue

RUN wget --no-check-certificate "https://drive.google.com/u/0/uc?id=14CYA7qV1Jsh5g-lpg46-tz9Whp8zN0aI&export=download" -O atomic-e801e22d2c32.nnue
RUN mv atomic-e801e22d2c32.nnue* engines/atomic-e801e22d2c32.nnue

RUN wget --no-check-certificate "https://drive.google.com/u/0/uc?id=168vawXrj2fEeRSLuWaL2pB7GXgQelE-c&export=download" -O crazyhouse-be2e41920378.nnue
RUN mv crazyhouse-be2e41920378.nnue* engines/crazyhouse-be2e41920378.nnue

RUN wget --no-check-certificate "https://drive.google.com/u/0/uc?id=16BQztGqFIS1n_dYtmdfFVE2EexF-KagX&export=download" -O horde-28173ddccabe.nnue
RUN mv horde-28173ddccabe.nnue* engines/horde-28173ddccabe.nnue

RUN wget --no-check-certificate "https://drive.google.com/u/0/uc?id=1x25r_1PgB5XqttkfR494M4rseiIm0BAV&export=download" -O kingofthehill-978b86d0e6a4.nnue
RUN mv kingofthehill-978b86d0e6a4.nnue* engines/kingofthehill-978b86d0e6a4.nnue

RUN wget --no-check-certificate "https://drive.google.com/u/0/uc?id=1Tiq8FqSu7eiekE2iaWQzSdJPg-mhvLzJ&export=download" -O racingkings-636b95f085e3.nnue
RUN mv racingkings-636b95f085e3.nnue* engines/racingkings-636b95f085e3.nnue
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Add the "--matchmaking" flag to start the matchmaking mode.
CMD python3 lichess-bot.py -u
