pkgname=eric4-i18n-cs
pkgver=4.5.14
pkgrel=1
pkgdesc="Czech translation for the Eric4 IDE"
arch=('any')
url="http://eric-ide.python-projects.org/index.html"
license=('GPL')
depends=('eric4')
source=(http://downloads.sourceforge.net/eric-ide/$pkgname-$pkgver.tar.gz)


package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/lib/python2.7/site-packages/eric4/i18n
  install -m644 ${srcdir}/eric4-$pkgver/eric/i18n/* \
    ${pkgdir}/usr/lib/python2.7/site-packages/eric4/i18n
}

md5sums=('062923fcc0e634b2e44c99d103f04c2e')
