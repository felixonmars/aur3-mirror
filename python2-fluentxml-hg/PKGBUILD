# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=python2-fluentxml-hg
pkgver=95
pkgrel=1
pkgdesc="XML library written in python"
arch=('any')
url="http://fluentxml.last-exile.org/"
license=('GPL3')
depends=('python2')
makedepends=('python2' 'mercurial')
provides=(python2-fluentxml)
conflicts=(python2-fluentxml)
source=()
md5sums=()

_hgroot='http://hg.last-exile.org'
_hgrepo='FluentXML'

build() {
  cd $srcdir/$_hgrepo
  python2 ./setup.py install --root=$pkgdir
}
