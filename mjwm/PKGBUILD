# Maintainer: chiku <chirantan.mitra@gmail.com>

pkgname="mjwm"
pkgver="4.0.0"
pkgrel="1"
pkgdesc="Create JWM menu from desktop files"
arch=("i686" "x86_64")
url="http://chiku.github.io/mjwm/"
license=("GPL3")
conflicts=("mjm")
optdepends=("jwm: for using generated menu")
source=("https://github.com/chiku/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("afc5466b3564f060164996281bc014bf")
sha1sums=("279493d8e094f76849151f97347ba040c1bd49c0")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
