# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Sylphe <florent.odier.at.gmail.com>

pkgname=sltar
pkgver=0.6
pkgrel=1

pkgdesc='A very small tarball extractor'
arch=(i686 x86_64)
url='https://github.com/Gottox/sltar'
license=('MIT')

source=("https://github.com/Gottox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('ae90b74f344f413ac8c7067aabdc0aa7')
sha256sums=('801859a8a50323f411a0595c45469c9729d4d2704951136b8e6f35b27c67ccc9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

