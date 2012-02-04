#Maintainer: Florian Bäuerle (florian.bae@gmail.com)

pkgname=xmltv-grabber-tvmovie
pkgver=1.2
pkgrel=0
pkgdesc="xmltv grabber for tvmovie (germany)"
arch=('any')
depends=('xmltv')
license=(unknown)
url="http://swolter.sdf1.org/software/article-tvmovie-1-2.html"
source=(http://swolter.sdf1.org/tvmovie-xmltv-${pkgver}.tar.gz)
md5sums=('5c882b1e6505fc12c78b2c337f0f145f')

build() {
  cd ${srcdir}/tvmovie-xmltv-${pkgver}
  ./configure --prefix=/usr

  make
}
package() {
  cd ${srcdir}/tvmovie-xmltv-${pkgver}

  make DESTDIR=${pkgdir} PREFIX=/usr install
}
