# Contributor: abcde <jkgjvbmnv@seznam.cz>

pkgname=gdat
pkgver=1.2
pkgrel=2
arch=()
pkgdesc="a date indicator in the system tray"
url="http://code.google.com/p/pacgahe/"
license="GPL"
depends=('python' 'pygtk' 'libglade' 'gnome-python-extras' 'config')
source=(http://pacgahe.googlecode.com/svn/trunk/gdat-$pkgver.tar.gz)
md5sums=('cfd0b98220adbca2d997d3a67d3b1d58')

build() {
  mkdir -p $startdir/pkg/{usr/{bin,share/gdat}}
  cd $startdir/src/$pkgname-$pkgver
  cp gdat $startdir/pkg/usr/bin/
  cp gdat.py $startdir/pkg/usr/share/gdat/
  cp -r gdat_about $startdir/pkg/usr/share/gdat/gdat_about
}
