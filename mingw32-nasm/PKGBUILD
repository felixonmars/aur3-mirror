_target=i486-mingw32
pkgname=mingw32-nasm
pkgver=2.09.10
pkgrel=2
pkgdesc="80x86 assembler designed for portability and modularity"
arch=(any)
url="http://www.nasm.us"
license=(BSD)
makedepends=('mingw32-gcc' 'mingw32-binutils' 'mingw32-w32api')
options=(!buildflags)
source=("http://www.nasm.us/pub/nasm/releasebuilds/${pkgver}/nasm-${pkgver}.tar.bz2")
md5sums=('15c79dcb5838870a0fac15feb5fade66')
sha1sums=('ca57a7454b29e18c64018e49cdf5c832937497ab')
sha256sums=('e3afb011f762144b4d13acb1f2d9363e4a73264dc6f2d3f4dab358c8203dd59e')
sha384sums=('75880e9f4293f1a61a2ced898c908bd66440380433576da95f92b2c6bd678ad5155d9c0db0bfc68fceab7a6172e05e9f')
sha512sums=('bc8648cc1bf4e97de4d27da0dc91ead8ee32aa35c74d13616e0af9691464d70e2e15ca288af195f867e7b6118cc913f98ed7b6955c4e9b0dc4702634ac4debef')

build() {
  cd "$srcdir/nasm-$pkgver"

  unset LDFLAGS
  ./configure --prefix=/usr/${_target} --build=$CHOST --host=${_target} || return 1
  make || return 1
  make INSTALLROOT="$pkgdir" install || return 1
  make INSTALLROOT="$pkgdir" install_rdf || return 1
  rm -rf usr/i486-mingw32/share
}
