# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pkgname=papilio-prog
pkgver=2.6
pkgrel=1
pkgdesc="CLI tool for loading Papilio bitstreams."
arch=("i686" "x86_64")
url="https://github.com/GadgetFactory/Papilio-Loader"
license=("GPL2" "LGPL2.1")
depends=(libftdi libftdi-compat)
optdepends=(papilio-udev)
conflicts=(papilio-loader-git)
makedepends=()
source=("https://github.com/GadgetFactory/Papilio-Loader/archive/V${pkgver}.tar.gz")
md5sums=('d8e3d384bac69a84d3e41ec23f41f0c6')

build() {
  cd "$srcdir/Papilio-Loader-$pkgver/papilio-prog"
  if [ ! -f ./configure ]; then
    chmod +x ./autogen.sh
    ./autogen.sh
  fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/Papilio-Loader-$pkgver/papilio-prog"
  make DESTDIR="$pkgdir" install
}
