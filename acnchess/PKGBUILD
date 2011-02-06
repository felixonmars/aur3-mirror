# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=acnchess
_mainver=0.0.1
_subver=69
pkgver=${_mainver}_${_subver}
pkgrel=5
pkgdesc="another Chinese chess game coded by Alf"
arch=('i686' 'x86_64')
url="http://code.google.com/p/acnchess/"
license=('GPL2')
depends=('gtk2>=2.6.0' 'rpmextract' 'openssl')
source=("http://acnchess.googlecode.com/files/$pkgname-${_mainver}-${_subver}.src.rpm")
md5sums=('a21cd520eaab3ceeb0604704f10da869')

build() {
  # compile fail if delele the following lines
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  export LDFLAGS="${LDFLAGS//--as-needed}"

  cd $srcdir
  rpmextract.sh $pkgname-${_mainver}-${_subver}.src.rpm
  bsdtar -xf $pkgname-${_mainver}.tar.gz
  cd "$srcdir/$pkgname-${_mainver}"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
