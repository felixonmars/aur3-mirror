pkgname=pmcyg
pkgver=2.1
pkgrel=1
pkgdesc="A tool for partially mirroring Cygwin(TM) packages."
arch=('any')
url="http://pmcyg.sourceforge.net/"
license=('GPL')
depends=('python>=3.1' 'tk')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tgz")

build() {
    return 0
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -dm755 ${pkgdir}/usr/bin
  make PREFIX="${pkgdir}/usr" install

  # Installing docs
  install -dm755 ${pkgdir}/usr/share/doc/pmcyg
  install -m644 {Authors,ChangeLog,README,ToDo}.txt ${pkgdir}/usr/share/doc/pmcyg

  # Installing examples
  install -dm755 ${pkgdir}/usr/share/pmcyg
  install -m644 *.pkgs ${pkgdir}/usr/share/pmcyg
}

sha256sums=('57d269a225e3314a7a123dd1374a5d4ab5037c3f0ada82f1ad67ff4197cae1cc')
