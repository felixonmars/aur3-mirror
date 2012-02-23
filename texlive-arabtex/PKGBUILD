# Maintainer: M Rawash <mrawash@gmail.com>
pkgname=texlive-arabtex
pkgver=3.11
pkgrel=1
pkgdesc="Extends the capabilities of (La)TeX to generate Arabic and Hebrew text"
arch=(any)
url="http://ftp.informatik.uni-stuttgart.de/ivi/bs/research/arab_e.htm"
license=('LPPL')
depends=(texlive-core)
install=$pkgname.install
source=(ftp://ftp.informatik.uni-stuttgart.de/pub/arabtex/arab311.tgz)
md5sums=('ded5e5c2e96afdf5827d58c6f41ea56a')

build() {
  mkdir -p "$pkgdir/usr/share/texmf"
  cp -r "$srcdir"/{tex,fonts,doc} "$pkgdir/usr/share/texmf"
}

# vim:set ts=2 sw=2 et:
