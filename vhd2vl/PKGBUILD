# Contributor: Roman Mikhayloff <rimf@inbox.ru>

pkgname=vhd2vl
pkgver=2.4
pkgrel=1
pkgdesc="Synthesizable VHDL into Verilog 2001 translator (converter)"
arch=('any')
url="http://doolittle.icarus.com/~larry/vhd2vl/"
license=('GPL')
makedepends=('flex>=2.5.35' 'bison>=2.3')
source=("http://doolittle.icarus.com/~larry/vhd2vl/${pkgname}-${pkgver}.tar.gz"
        "fix_n_install.patch")
sha256sums=('014cf7965647fe1937916187c208ecdfaa06cffdf4c3383b893191927fb8b645'
            'c551c5ec36452d148ba577d7e7e04fef2364729d0f9a0b227835d6f500d7cac2')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../fix_n_install.patch
}

build() {
  echo
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make
}

package() {
  echo
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make DESTDIR="${pkgdir}/" install
}
