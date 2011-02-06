# Maintainer: Flamelab <panosfilip@gmail.com>

pkgname=librgba-gtk-module
_realpkgname=librgba
license=("GPL")
arch=('i686' 'x86_64')
pkgver=0.2
pkgrel=1
pkgdesc="Gtk+ module to activate RGBA in GTK apps."
url="http://gnome-look.org/content/show.php/RGBA+Gtk%2B+module?content=100556"
depends=('gnome-color-chooser' 'gtk-engine-murrine')
makedepends=('gtk2' 'gcc' 'pkgconfig')
source=("http://gnome-look.org/CONTENT/content-files/100556-${_realpkgname}.c")
install=librgba-gtk-module.install
md5sums=('eb14091716e02ea40d1783e86703cb86')

build() 

{  
  cd ${srcdir}
  msg "Building ${_realpkgname} ..."
  gcc -fPIC -shared *librgba.c -o librgba.so `pkg-config --cflags --libs gtk+-2.0`
  mkdir -p ${pkgdir}/usr/lib/gtk-2.0/modules/
  install -m755 ${srcdir}/librgba.so ${pkgdir}/usr/lib/gtk-2.0/modules/
}
