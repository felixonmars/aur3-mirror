# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
pkgname=python2-imdbpie
pkgver=1.4.4
pkgrel=1
pkgdesc='IMDB client using the IMDB json web service'
arch=('any')
url='http://github.com/richardasaurus/imdb-pie'
license=('CCPL:cc-by-nc-sa')
depends=('python2' 'python2-requests')
source=(http://pypi.python.org/packages/source/i/imdbpie/imdbpie-${pkgver}.tar.gz)
md5sums=('9b33d1534fbe8e3f8f5e1cd724a3e86e')

package() {
  cd imdbpie-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
