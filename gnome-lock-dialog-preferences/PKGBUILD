# Old Contributor: adamruss 
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=gnome-lock-dialog-preferences
pkgver=0.3.2
pkgrel=2
_ppa_pkgver=0
pkgdesc="GNOME Lock Dialog Preferences allows you to set various options for the screensaver lock dialog in GNOME"
url="https://launchpad.net/gnome-lock-dialog-preferences"
license="GPL"
depends=('libglade')
makedepends=('intltool' 'gnome-common')
source=(http://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}_${pkgver}-${_ppa_pkgver}~ppa1.tar.gz)
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}

md5sums=('b990a08a72fd0cddabe93e6a9c5a9aad')
