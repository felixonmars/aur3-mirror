# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=online-desktop
pkgver=0.3.2
pkgrel=1
pkgdesc="The goal of the GNOME Online Desktop is to adapt the desktop to become the perfect window for online applications"
arch=('i686' 'x86_64')
url="http://live.gnome.org/OnlineDesktop"
license=('GPL')
depends=('desktop-data-model' 'gnome-python-desktop')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.3/$pkgname-$pkgver.tar.bz2)
md5sums=('90f27f4229c0a62c79e167de956b2eae')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-gconf-schema-file-dir=/usr/share/gconf/schemas

  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install || return 1
}

