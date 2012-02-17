#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
python=python2
name=flatland
pkgname=$python-$name-hg
pkgver=290
pkgrel=1
pkgdesc="maps between rich, structured Python application data and the string-oriented flat namespace of web forms, key/value stores, text files and user input. Flatland provides a schema-driven mapping toolkit with optional data validation."
depends=('python2')
arch=('any')
url="http://discorporate.us/projects/flatland/"
license=('MIT')
provides=('flatland')
makedepends=('mercurial')

_hgroot="http://bitbucket.org/jek"
_hgrepo=$name

build() {
  cd $srcdir/$name
  $python setup.py install --prefix=/usr --root=$pkgdir
}
