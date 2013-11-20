# By Rick dos Santos 
# Rickpbusantos@gmail.com
# http://www.facebook.com/rickdossantos 
# Bugs relatar no E-mail Rickpbusantos@gmail.com ou rickpbusantos@sejalivre.org
# Versão 1.1
zenity --title="Seleção de pacotes" --width="500" --height="500" --text="Marque os pacotes que deverão ser instalados" --list --checklist --column "A Instalar" --column "Pacotes" TRUE dvdrip TRUE k3b TRUE filezilla TRUE opera TRUE free-ttf-fonts TRUE fetchmsttfonts TRUE gstreamer-0_10 TRUE libdvdcss2 TRUE lame TRUE w32codec-all TRUE libdvdplay0 TRUE libavdevice52 TRUE gstreamer-0_10-plugins-bad TRUE gstreamer-0_10-plugins-ugly TRUE inkscape TRUE blender TRUE scribus TRUE fontmatrix TRUE calligra-krita TRUE clementine TRUE smplayer TRUE vlc TRUE xbmc TRUE pidgin TRUE skype TRUE kdenlive TRUE geany TRUE chromium TRUE audacious TRUE audacity TRUE  bleachbit > saida.txt 

cat saida.txt | (sed -e 's/|/ /g;s/:/_/g' )  > pacotes.txt

instalar=`cat pacotes.txt` 


(zenity --title="Atenção" --question --text="Você deseja prosseguir com a instalação dos pacotes $ler?") &&
 
(zypper --no-gpg-checks --quiet ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_13.1/ "Packman" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionado repositório Principal" --progress --pulsate
zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/server:/database/openSUSE_13.1/ "Jogos" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionado repositório Jogos" --progress --pulsate 
zypper --no-gpg-checks --quiet ar  http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_13.1/ "multmedia" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionado repositório Multimídia" --progress --pulsate

zypper --no-gpg-checks --quiet ar  http://download.opensuse.org/repositories/graphics/openSUSE_13.1/ "Graphics" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionado repositório Gráficos..." --progress --pulsate 

zypper --no-gpg-checks --quiet ar  http://download.opensuse.org/repositories/multimedia:/apps/openSUSE_13.1/ "av" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionado repositório Áudio e Video" --progress --pulsate --percentage="50"

zypper --no-gpg-checks --quiet ar  http://download.opensuse.org/repositories/KDE:/Extra/openSUSE_13.1/ "Extras" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionando repositorio Extras" --progress --pulsate

zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/network/openSUSE_13.1/ "network" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionando repositorio Network" --progress --pulsate


zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/openSUSE:/13.1/standard/ "skype" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionando repositorio Network Extra" --progress --pulsate


zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/home:/lijews:/branches:/OBS_Maintained:/opera/openSUSE_12.3_NonFree_Update/ "nonfree1" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionando repositorio NonFree" --progress --pulsate

zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/M17N:/fonts/openSUSE_13.1/ "Fontes" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionando repositorio de Fontes" --progress --pulsate

zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/home:/Simmphonie/openSUSE_13.1/ "av2" | zenity --title="Adicionado repositórios" --width="500" --height="200" --text="Adicionando repositorio Multimídia Extra" --progress --pulsate

zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/GNOME:/Apps/openSUSE_13.1/ "grafico" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Graficos Extra" --progress --pulsate

zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/GNOME:/Apps/openSUSE_13.1/ "pidgin" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Extra" --progress --pulsate

zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/network:/chromium/openSUSE_13.1/ "net2" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Extra" --progress --pulsate

zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/home:/RedDwarf/openSUSE_13.1/ "auda" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Extra" --progress --pulsate

zypper --no-gpg-checks --quiet ar http://download.opensuse.org/repositories/utilities/openSUSE_13.1/ "utilidades" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Extra" --progress --pulsate

 zypper --non-interactive --quiet install $instalar | zenity --title="Instalando" --width="500" --height="200" --title="Instalando pacotes" --text="Instalando pacotes aguarde..." --progress --pulsate




zypper rr Packman Jogos multmedia Graphics av Extras network skype Fontes av2 grafico pidgin net2 auda utilidades | zenity --title="Removendo repositórios" --width="500" --height="300" --text="Removendo repositórios aguarde..." --progress --pulsate

zenity --title="Sucesso" --width="300" --height="100" --info --text="Pacotes instalados com sucesso"



)
