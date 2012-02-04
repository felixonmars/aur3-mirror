# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname="lucu"
pkgver="0.0"
pkgrel=1
pkgdesc="lucu is init ram disk builder"
arch=(any)
depends=(make)
makedepends=()
optdepends=()
url="http://people.oh14.de/andrej/lucu"
source=(http://people.oh14.de/andrej/lucu/lucu-0.0-stickbuild.tar.xz)
license="custom"
build()
{
 cd "$srcdir/$pkgname-$pkgver"
 export PREFIX=/usr
 export ETCDIR=/etc
 export BINDIR=$PREFIX/bin
 export LIBDIR=$PREFIX/lib
 export DESTDIR="${startdir}/pkg"
 make || return 1
 make install
}
md5sums=('168266fc9ddcbf8b5847eade553b1d2f')
sha512sums=('89c40c2d0aa9584e6c896cc4f968fec2961129b3da6dcb263fdd2dc03e9c5ede050b94dca30ca7527c9ae35288ecac914ef17046d08ac09bf16c4839d8bb7adc')
