# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=unidata-decoders-perl
pkgver=5.0.0
pkgrel=1
pkgdesc="Unidata various data format decoders"
url="http://www.unidata.ucar.edu/software/decoders"
license="custom"
arch=(i686 x86_64)
depends=(perl)
makedepends=(gcc)
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.unidata.ucar.edu/pub/decoders/perlDecoders-$pkgver.tar.gz)
md5sums=('01fe67169120500771d6fc587367e82a')

build() {
  cd $startdir/src/perlDecoders-$pkgver/src
  make || return 1
  make exec-prefix=$startdir/pkg/usr prefix=$startdir/pkg/usr \
       DESTDIR=$startdir/pkg ETCDIR=$startdir/pkg/usr/share/$pkgname \
       MANDIR=$startdir/pkg/usr/man BINDIR=$startdir/pkg/usr/bin \
       install || return 1
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  install $startdir/src/perlDecoders-$pkgver/src/COPYRIGHT \
          $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
