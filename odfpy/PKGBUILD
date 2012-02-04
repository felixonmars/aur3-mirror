# Contributor: Geoff Teale <tealeg@member.fsf.org>
pkgname=odfpy
pkgver=0.9.1
pkgrel=1
pkgdesc="A complete API for OpenDocument in Python"
arch=('i686' 'x86_64')
url="http://opendocumentfellowship.com/projects/odfpy"
license=('GPL')
depends=('python')
source=("http://forge.osor.eu/frs/download.php/552/odfpy-0.9.1.tar.gz")
md5sums=('0d6d5cf7a07b9295550cd2845e8f159d')

build() {
      cd "$srcdir/${pkgname}-${pkgver}"
      python setup.py install --root=${pkgdir}
}
