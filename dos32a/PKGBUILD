# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=dos32a
pkgver=9.1.2
pkgrel=1
pkgdesc="DOS32/A Advanced DOS Extender"
arch=("any")
license=("custom")
url="http://dos32a.narechk.net"
md5sums=('f37ae16b8eab499edb6b0de0099827ca')
source=("http://download.narechk.net/${pkgname}-${pkgver//./}-bin.zip")

build() {
  cd "$srcdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
  cd "binw"
  install -d "${pkgdir}/usr/share/${pkgname}" || return 1
  install -m644 -t "${pkgdir}/usr/share/${pkgname}" *.exe || return 1
}

