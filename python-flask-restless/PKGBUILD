# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>
# Submitter: Zoran Zeric <zz@zoranzaric.de>

pkgname=python-flask-restless
pkgver=0.17.0
pkgrel=1
pkgdesc="A Flask extension for easy ReSTful API generation"
arch=('any')
url="http://pypi.python.org/pypi/Flask-Restless"
license=('BSD' 'AGPL3')
depends=('python-flask>=0.10' 'python-sqlalchemy>=0.8' 'python-mimerender>=0.5.2' 'python-dateutil>2.2')
optdepends=('python-flask-sqlalchemy')
makedepends=('python-distribute')
conflicts=('python-flask-restless-git')
source=("http://pypi.python.org/packages/source/F/Flask-Restless/Flask-Restless-$pkgver.tar.gz" "LICENSE")
md5sums=('624525e7771db91916feed75ad34aa5a'
         '36614a8603a78ab0e150cfc638dd2372')

build() {

  cd $srcdir/Flask-Restless-$pkgver
  python setup.py build
}

package() {

  cd $srcdir/Flask-Restless-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
