# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>
# Submitter: Zoran Zeric <zz@zoranzaric.de>

pkgname=python2-flask-restless-git
pkgver=0.10.1.23.g0869732
pkgrel=1
pkgdesc="A Flask extension for easy ReSTful API generation"
arch=('any')
url="http://pypi.python.org/pypi/Flask-Restless"
license=('custom:BSD' 'AGPL3')
depends=('python2-flask>=0.7' 'python2-sqlalchemy' 'python2-dateutil')
optdepends=('python2-simplejson: For python2 version under 2.6'
            'python2-flask-sqlalchemy')
makedepends=('python2-distribute' 'git')
provides=('python2-flask-restless')
conflicts=('python2-flask-restless')
source=("git://github.com/jfinkels/flask-restless.git")
md5sums=('SKIP')

_gitname="flask-restless"

pkgver() {
  cd "$srcdir"/$_gitname
  git describe --always | sed 's|-|.|g'
}

build() {

  cd "$srcdir/$_gitname"

  python2 setup.py build
}

package() {

  cd "$srcdir/$_gitname"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 $srcdir/$_gitname/LICENSE.BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
