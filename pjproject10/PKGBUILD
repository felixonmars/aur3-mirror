# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=pjproject10
pkgver=1.0.3
pkgrel=1
pkgdesc="Open source SIP stack and media stack"
arch=('i686' 'x86_64')
url="http://www.pjsip.org/"
license=('GPL')
depends=()
makedepends=('alsa-lib' 'e2fsprogs' 'python')
source=(http://www.pjsip.org/release/${pkgver}/pjproject-${pkgver}.tar.bz2 \
  $pkgname.diff)
md5sums=('1680ed5ffa00ab38449efc2affda53c5'
         '2d764ed98514d0303daa5f962069d58f')

build() {
  cd "$startdir/src/pjproject-$pkgver"
  patch -p1 < "$startdir/$pkgname.diff" || return 1

  ./configure --prefix=/usr --disable-debug --enable-ssl
  make || return 1
  make DESTDIR="$pkgdir" prefix=/usr install
}

# vim:set ts=2 sw=2 et:
