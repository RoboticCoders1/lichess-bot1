FROM ubuntu:jammy
COPY . .

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget unzip python3 python3-pip

RUN mv config.yml.default config.yml
RUN wget https://abrok.eu/stockfish/latest/linux/stockfish_x64_bmi2.zip -O stockfish.zip
RUN unzip stockfish.zip && rm stockfish.zip
RUN mv stockfish_* engines/stockfish 
RUN chmod +x engines/stockfish
RUN python3 -m pip install --no-cache-dir -r requirements.txt

CMD python3 lichess-bot.py -u
