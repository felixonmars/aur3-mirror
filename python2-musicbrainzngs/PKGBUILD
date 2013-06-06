# Maintainer: Adrian Sampson <adrian@radbox.org>

python=python2
name=musicbrainzngs

pkgname=$python-$name
pkgver=0.4
pkgrel=2
pkgdesc="bindings for the MusicBrainz NGS service"
depends=('python2')
makedepends=('python2-distribute')
arch=('any')
source=(http://pypi.python.org/packages/source/m/$name/$name-$pkgver.tar.gz)
md5sums=(ec4323fa1ad4938f9376496bc8c27b05)
url="https://github.com/alastair/python-musicbrainz-ngs"
license="BSD"

build() {
  cd $srcdir/$name-$pkgver
  $python setup.py build || return 1
}

package() {
  cd $srcdir/$name-$pkgver
  # In version 0.4, setup.py installs unnecessary data in the wrong
  # location.
  rm -rf build/lib/{docs,examples,test}
  $python setup.py install --root=$pkgdir --skip-build
}
