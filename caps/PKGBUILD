# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=caps
pkgver=0.9.7
pkgrel=1
pkgdesc="The C* Audio Plugin Suite"
arch=('i686' 'x86_64')
url="http://quitte.de/dsp/caps.html"
license=('GPL')
options=(docs)
depends=('gcc-libs')
optdepends=('python: optional CFLAGS check')
source=("http://quitte.de/dsp/${pkgname}_${pkgver}.tar.bz2")
md5sums=('d74582d3ae7a4244d3a77501693bbdf3')
sha256sums=('a07e90cfca12611f1188e5bb24a48cc45022699114948e104c9a00224746494f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure.py
  make
 }
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -v -m 0755 -D caps.so ${pkgdir}/usr/lib/ladspa/caps.so
  install -v -m 0644 -D caps.rdf ${pkgdir}/usr/share/ladspa/rdf/caps.rdf
}
