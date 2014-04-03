# Maintainer: chiku <chirantan.mitra@gmail.com>

pkgname="mjm"
_internalname="mjwm"
pkgver="2.4.0"
pkgrel="1"
pkgdesc="Create JWM menu from desktop files"
arch=("i686" "x86_64")
url="https://github.com/chiku/mjwm"
license=("GPL3")
optdepends=("jwm: for using generated menu")
source=("https://github.com/chiku/${_internalname}/archive/v${pkgver}.tar.gz")
md5sums=("141fb9a46ad1e727219124c78e450e52")
sha1sums=("0d9620179a214a6cde5877d27e2eace477ed6654")

build() {
  cd "$srcdir/${_internalname}-${pkgver}"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_internalname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  cd ${pkgdir}/usr/bin
  ln -sv ${_internalname} ${pkgname}
}
