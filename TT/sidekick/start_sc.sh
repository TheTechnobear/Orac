#/bin/bash
sudo JACK_NO_AUDIO_RESERVATION=1 /usr/bin/jackd -R -P 95 -d alsa -d hw:0 -r 48000 -n 3 -p 128 -S -s &
#sudo systemctl start norns-jack.service
sleep 1

