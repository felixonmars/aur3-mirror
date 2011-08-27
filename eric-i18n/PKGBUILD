# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=eric-i18n
pkgver=4.4.9
pkgrel=1
pkgdesc="Translations for the Eric IDE (cs-de-es-it-fr-ru-tr-zh_cn)"
arch=('any')
url="http://eric-ide.python-projects.org/index.html"
license=('GPL')
depends=('eric')
source=(http://downloads.sourceforge.net/eric-ide/eric4-i18n-cs-$pkgver.tar.gz \
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-de-$pkgver.tar.gz \
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-es-$pkgver.tar.gz \
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-fr-$pkgver.tar.gz \
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-it-$pkgver.tar.gz \
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-ru-$pkgver.tar.gz \
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-tr-$pkgver.tar.gz \
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-zh_CN.GB2312-$pkgver.tar.gz)
md5sums=('17b06f8a8dbe56caab4e09a8f66a01c6'
         'a98c2516fdcec4bb665e1d47c96ef6fc'
         '014f5f21f998ce96f563ba8f24117b53'
         'c86d29139893aa92afeac669a4c0ef1e'
         '9cc7aa773877b0533d10d04f7cdcb400'
         '23b971383b56f3e5cbfbfbd80a1970cc'
         '1eb529037d566aa9861c071e56149380'
         '3154ad679c580327bae08a92ff3e5dc8')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/lib/python2.7/site-packages/eric4/i18n
  install -m644 ${srcdir}/eric4-$pkgver/eric/i18n/* \
    ${pkgdir}/usr/lib/python2.7/site-packages/eric4/i18n
}
