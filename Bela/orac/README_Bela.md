INCOMPLETE/INACCURATE PLACEHOLDER

## Bela installation


Bela install is derived from the standard core orac build, 
````_main.pd````
is the launch script as normal, this embeds mother.pd (normal midi), and main.pd 
also some Bela subpatches are provided for accessing digital and analog io
(this is still work in progress)

Note: there is a bela device in KontrolRack but currently its the same as midi, so we just use midi for not
this may change, in which case a custom main.pd would be used


Orac is installed as a Bela project under 
```` 
~/Projects/Bela
````

It is assumed you will use MEC with oscdisplay for interactive use and configuration
this can be started with servicectl found in scripts/mec.service
