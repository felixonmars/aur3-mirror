# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('pidgin-logstatus')

pkgver=0.8
pkgrel=1

pkgdesc="Pidgin plugin for logging status changes of buddies into conversation log"
url="http://bla.thera.be/article/pidgin-status-history"

arch=('x86' 'x86_64')
license=('GPL2')
depends=('pidgin')

source=("http://thera.be/my_public/my_projects/${pkgname}-${pkgver}v.tar.bz2"
  "logstatus.c.patch")
sha512sums=('96e1b17dc6307d27a49b1ebc6166704040bfd27951bdbb408e8d3cce3e61bc0294591b4a38c4e1680e0e4651ee3731c45232ef8d10e0a9762fe1fa84f4cc5ae8'
  'e083364432eb03dc729238f1c2bf5e83aa158ede903508dd1b79c4caf082d50fad5444af1bead35d9e72012213e2f5730ab6b39a440e5a299da9824dacd80a44')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}v"
  patch < "${srcdir}/logstatus.c.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}v"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}v"
  make PREFIX="${pkgdir}/usr" install
}

