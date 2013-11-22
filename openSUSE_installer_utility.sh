# By Rick dos Santos 
# Rickpbusantos@gmail.com
# http://www.facebook.com/rickdossantos 
# Bugs relatar no E-mail Rickpbusantos@gmail.com ou rickpbusantos@sejalivre.org
# Versão 1.3 beta 

usrcheck=`whoami`

case $usrcheck in

root)
selecao () {
(zenity --title="Seleção de pacotes" --width="500" --height="500" --text="Marque os pacotes que deverão ser instalados" --list --checklist --column "Para instalar" --column "Pacotes" TRUE k3b TRUE filezilla TRUE opera TRUE free-ttf-fonts TRUE fetchmsttfonts TRUE gstreamer-0_10 TRUE lame TRUE w32codec-all TRUE libdvdplay0 TRUE libavdevice52 TRUE gstreamer-0_10-plugins-bad TRUE gstreamer-0_10-plugins-ugly TRUE inkscape TRUE blender TRUE scribus TRUE fontmatrix TRUE calligra-krita TRUE clementine TRUE smplayer TRUE vlc TRUE xbmc TRUE pidgin TRUE kdenlive TRUE geany TRUE chromium TRUE audacious TRUE audacity TRUE  bleachbit > .saida.txt) &&

cat .saida.txt | (sed -e 's/|/ /g;s/:/_/g' )  > .pacotes.txt

instalar=`cat .pacotes.txt`
}
selecao
while [ $instalar -s ]; do

zenity --title="Atenção" --warning --text="nem um pacote selecionado"
selecao 
done

(zenity --title="Atenção" --question --text="Você tem certeza que deseja prosseguir?") &&
 

addr () {
(zypper --no-gpg-checks  ar http://download.opensuse.org/update/13.1/ "Update" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Principal" --progress --pulsate --auto-close

zypper --no-gpg-checks  ar http://download.opensuse.org/distribution/13.1/repo/oss/ "Oss" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Principal" --progress --pulsate --auto-close 

zypper --no-gpg-checks ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_13.1/ "Packman" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Packman" --progress --pulsate --auto-close)

}

addr

grep "filezilla" .pacotes.txt

if [ "$?" = "0" ]
then
zypper --no-gpg-checks  ar http://download.opensuse.org/repositories/network/openSUSE_13.1/ "Network" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Network" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi

grep "opera" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks ar http://download.opensuse.org/repositories/home:/lijews:/branches:/OBS_Maintained:/opera/openSUSE_12.3_NonFree_Update/ "NonFree" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio NonFree" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "free-ttf-fonts" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks ar http://download.opensuse.org/repositories/M17N:/fonts/openSUSE_13.1/ "Fontes" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Fontes" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi 

grep "fetchmsttfonts" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks ar  http://download.opensuse.org/repositories/graphics/openSUSE_13.1/ "Graphics" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Graficos" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "gstreamer-0_10" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_13.1/ "Multimedialibs" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Multimedia" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "lame" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar http://download.opensuse.org/repositories/home:/Simmphonie/openSUSE_13.1/ "Simmphonie" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Simmphonie" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "gstreamer-0_10-plugins-bad" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_13.1/ "Multimedialibs" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Multimedia" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "gstreamer-0_10-plugins-ugly" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_13.1/ "Multimedialibs" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Multimedia" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "inkscape" .pacotes.txt

if [ "$?" = "0" ]
then
zypper --no-gpg-checks ar http://download.opensuse.org/repositories/GNOME:/Apps/openSUSE_13.1/ "GnomeExtras" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Gnome Extras" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "blender" .pacotes.txt

if [ "$?" = "0" ]
then
zypper --no-gpg-checks ar http://download.opensuse.org/repositories/GNOME:/Apps/openSUSE_13.1/ "GnomeExtras" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Gnome Extras" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "scribus" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/KDE:/Extra/openSUSE_13.1/ "KdeExtras" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Kde Extras" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi

grep "fontmatrix" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/KDE:/Extra/openSUSE_13.1/ "KdeExtras" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Kde Extras" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi

grep "calligra-krita" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/KDE:/Extra/openSUSE_13.1/ "KdeExtras" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Kde Extras" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi

grep "clementine" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/multimedia:/apps/openSUSE_13.1/ "MultimediaApps" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Multimedia" --progress --pulsate --auto-close
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_13.1/ "Multimedialibs" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Multimedia" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "smplayer" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/KDE:/Extra/openSUSE_13.1/ "KdeExtras" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Kde Extras" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi

grep "vlc" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_13.1/ "Multimedialibs" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Multimedia" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "pidgin" .pacotes.txt

if [ "$?" = "0" ]
then
zypper --no-gpg-checks ar http://download.opensuse.org/repositories/GNOME:/Apps/openSUSE_13.1/ "GnomeExtras" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Gnome Extras" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "geany" .pacotes.txt 

if [ "$?" = "0" ]
then
zypper --no-gpg-checks ar http://download.opensuse.org/repositories/GNOME:/Apps/openSUSE_13.1/ "GnomeExtras" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Gnome Extras" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "chromium" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar http://download.opensuse.org/repositories/network:/chromium/openSUSE_13.1/ "Chromium" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Chromium" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi 

grep "audacious" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar http://download.opensuse.org/repositories/home:/RedDwarf/openSUSE_13.1/ "RedDwarf" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio RedDwarf" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi 

grep "audacity" .pacotes.txt

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/multimedia:/apps/openSUSE_13.1/ "MultimediaApps" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Multimedia" --progress --pulsate --auto-close
zypper --no-gpg-checks  ar  http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_13.1/ "Multimedialibs" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio Multimedia" --progress --pulsate --auto-close
else 
echo " Repositório ignorado "
fi

grep "bleachbit" .pacotes.txt 

if [ "$?" = "0" ]
then 
zypper --no-gpg-checks  ar http://download.opensuse.org/repositories/utilities/openSUSE_13.1/ "Utilidades" | zenity --title="Adicionado repositórios" --width="500" --height="100" --text="Adicionando repositorio de Utilidades" --progress --pulsate --auto-close
else
echo " Repositório ignorado "
fi

 (zypper --gpg-auto-import-keys refresh | zenity --title="Atualizando repositórios" --width="500" --height="100" --text="Atualizando repositórios aguarde" --progress --pulsate --auto-close) &&

 (zypper --non-interactive install $instalar | zenity --title="Instalando" --width="500" --height="200" --title="Instalando pacotes" --text="Instalando pacotes aguarde..." --progress --pulsate --auto-close) &&

varerro () {
if [ "$?" = "0" ]
then 
zenity --title="Sucesso" --width="300" --height="100" --info --text="Pacotes instalados com sucesso"
else
echo "passed"
fi
}
(zypper rr Packman Jogos Multimedialibs Graphics MultimediaApps Network NonFree Fontes Simmphonie GnomeExtras KdeExtras Chromium RedDwarf Utilidades | zenity --title="Removendo repositórios" --width="500" --height="300" --text="Removendo repositórios aguarde..." --progress --pulsate) && 

varerro;;

*)
zenity --title="Erro" --error --text="Você precisa estar como root para prosseguir" --width="400" --height="80";;
esac




