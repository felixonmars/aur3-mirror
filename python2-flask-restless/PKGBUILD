# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>
# Submitter: Zoran Zeric <zz@zoranzaric.de>

pkgname=python2-flask-restless
pkgver=0.11.0
pkgrel=1
pkgdesc="A Flask extension for easy ReSTful API generation"
arch=('any')
url="http://pypi.python.org/pypi/Flask-Restless"
license=('BSD' 'AGPL3')
depends=('python2-flask>=0.7' 'python2-sqlalchemy' 'python2-dateutil')
optdepends=('python2-simplejson: For python2 version under 2.6'
            'python2-flask-sqlalchemy')
makedepends=('python2-distribute')
conflicts=('python2-flask-restless-git')
source=("http://pypi.python.org/packages/source/F/Flask-Restless/Flask-Restless-$pkgver.tar.gz" "LICENSE")
md5sums=('e81080d55ed6ba06abcce133ffbde772'
         '36614a8603a78ab0e150cfc638dd2372')

build() {

  cd $srcdir/Flask-Restless-$pkgver
  python2 setup.py build
}

package() {

  cd $srcdir/Flask-Restless-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
