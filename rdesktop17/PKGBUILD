# $Id: PKGBUILD 192435 2013-08-11 19:09:27Z eric $
# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=rdesktop17
__realpkgname=rdesktop
pkgver=1.7.1
pkgrel=1
pkgdesc="An open source client for Windows Remote Desktop Services"
arch=('i686' 'x86_64')
url="http://www.rdesktop.org/"
license=('GPL3')
depends=('libao' 'libsamplerate' 'xorg-xrandr' 'pcsclite')
conflicts=('rdesktop')
source=("http://downloads.sourceforge.net/${__realpkgname}/${__realpkgname}-${pkgver}.tar.gz")
md5sums=('c4b39115951c4a6d74f511c99b18fcf9')

prepare() {
  cd ${__realpkgname}-${pkgver}
}

build() {
  cd ${__realpkgname}-${pkgver}
  ./configure --prefix=/usr \
    --enable-smartcard \
    --with-ipv6
  make
}

package() {
  cd ${__realpkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
