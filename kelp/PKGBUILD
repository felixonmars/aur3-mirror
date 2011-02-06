# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname=kelp
pkgver=1.4
pkgrel=2
pkgdesc="a framework for taking notes about source code files in a simple way"
arch=('i686' 'x86_64')
url="http://kelp.sourceforge.net/"
license=('GPLv3')
depends=()
conflicts=('kelp-hg')
source=(http://downloads.sourceforge.net/project/kelp/kelp/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('7ca3b05bbd1eb5b938beb4f2cf7a5bd0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 kelp ${pkgdir}/usr/bin/kelp
  install -Dm755 plantforest ${pkgdir}/usr/bin/plantforest
  install -Dm644 COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
  install -Dm644 kelp.1 ${pkgdir}/usr/share/man/man1/kelp.1
  install -Dm644 plantforest.1 ${pkgdir}/usr/share/man/man1/plantforest.1
  install -Dm644 README.txt ${pkgdir}/usr/share/doc/${pkgname}/README.txt
}

# vim:set ts=2 sw=2 et:
