# Contributor: Johannes Marbach <jm@rapidrabbit.de>
pkgname=guake-focus
pkgver=0.4.1
pkgrel=1
pkgdesc='Guake is a drop-down terminal for Gnome Desktop Environment. This version comes with a special focus patch applied.'
arch=('i686' 'x86_64')
url='http://guake-terminal.org'
license=('GPL')
depends=('python-notify' 'vte' 'gconf' 'gnome-python' 'dbus-python' 'notification-daemon')
makedepends=('libx11' 'pkgconfig' 'perlxml' 'intltool')
install=guake.install
source=(http://trac.guake-terminal.org/files/guake-$pkgver.tar.gz focus.patch)
md5sums=('c3bd763f0a7c91cb453c32d8045fa6ca'
         '59c1306b730f77c72941b446f1c037e0')

build() {
  cd "$startdir/src/guake-$pkgver"
  ./configure --sysconfdir=/usr/share --prefix=/usr
  patch -p1 < ../focus.patch || return 1
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

