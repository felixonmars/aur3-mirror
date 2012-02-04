# Maintainer:  Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>

pkgname=switchscreen-tri
pkgver=0.1.2
pkgrel=1
pkgdesc="a tool to switch between monitors (supporting non-xinerama setups)"
url="http://nks.sixserv.org"
license=("GPL")
arch=("i686" "x86_64")
depends=("libxtst")
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz")
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=("dbdf8896c3f463c2af4ff55316a1e102")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
  make DESTDIR="${pkgdir}" install
}
