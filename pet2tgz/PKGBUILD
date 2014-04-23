# Maintainer: Никола Вукосављевић <hauzer@gmx.com>

pkgname=pet2tgz
pkgver=0.3
pkgrel=2
pkgdesc="Convert Puppy Linux .pet files to .tar.gz archives."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/${pkgname}/"
license=('GPL3')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e6d2612c27184ea06114f9ee1927f0d1c6fa5f2bdecd85366d4b35564b59318a123159180eb3da747d46d4ddcdd2f4ec40def0b10d2882acafe5ed40e84826c5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

