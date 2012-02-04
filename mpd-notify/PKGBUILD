# Maintainer:  Matias Hernandez <msdark at archlinux dot us>
pkgname=mpd-notify
pkgver=0.2
pkgrel=
pkgdesc="mpd-notify es un sistema de notificacion para mpd utilizando libnotify
Esta escrito en C y utiliza libmpdclient para la coneccion con mpd"
arch=('i686' 'x86_64')
license=('GPL')
install=mpd-notify.install
url="http://msdarkici.wordpress.com/2008/09/15/un-nuevo-aporte-mpd-notify/"
depends=(libnotify)
source=("http://aur.archlinux.org/packages/mpd-notify/mpd-notify.$pkgver.tar.gz")
md5sums=()
build() {
  	gcc mpd-notify.c libmpdclient.c -o mpd-notify
        cp mpd-notify /usr/local/bin/
        cp mpd-notify-daemon /usr/local/bin
        echo "********************************************************"
        echo "Para iniciar mpd-notify ejecutar mpd-notify-daemon start"
        echo ""
        echo "Para iniciarlo automaticamente agregar mpd-notify-daemon start
        a tus programas de inicio"
        echo " "
        echo "Instalado Correctamente"
        echo " "
}
