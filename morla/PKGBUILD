# Contributor: Jiri Prochazka <ojirio at gmail.com>
pkgname=morla
pkgver=0.16.1
pkgrel=1
pkgdesc="editor of RDF documents, can visualize graphs, use templates for quick writing and exec SPARQL/RDQL queries"
arch=(i686 x86_64)
url="http://www.morlardf.net/index.php"
license=('gpl')
depends=('gconf' 'libnxml' 'libgtkhtml' 'redland')
makedepends=('autoconf' 'automake')
conflicts=()
source=(http://www.morlardf.net/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('944fc4f999b145c74f91f20a5548bb76')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make prefix=${pkgdir}/usr install || return 1
}
