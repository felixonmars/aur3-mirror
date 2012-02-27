# Contributor: Paul Colomiets pc at gafol dot net

pkgname=gnome-keyring-manager
pkgver=2.20.0
_majorver=2.20
pkgrel=1
pkgdesc="A keyring management program for the GNOME Desktop"
arch=('i686' 'x86_64')
url="http://live.gnome.org/GnomeKeyring"
license=('GPL')
depends=('gnome-keyring' 'libgnomeui')
makedepends=('gnome-doc-utils')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/$_majorver/$pkgname-$pkgver.tar.bz2)
md5sums=('61d701888f00c02490c0cd551bf3fcb1')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
