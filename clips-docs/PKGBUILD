# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: jht <stefano@inventati.org>

pkgname=clips-docs
pkgver=6.24
pkgrel=2
pkgdesc='A Tool for Building Expert Systems - Documentation'
arch=('any')
url='http://clipsrules.sourceforge.net/'
license=('custom')
install='clips-docs.install'
source=("http://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/documentation_${pkgver/./}.zip"
	    'LICENSE')
md5sums=('08f225f79667628b168755af2825c974'
         '703bc2580bd7630c29f1f36d7399bcc5')

package() {
  install -d ${pkgdir}/usr/share/doc/clips/

  install -m644 *.pdf \
    ${pkgdir}/usr/share/doc/clips/

  install -D -m644 ${srcdir}/LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
