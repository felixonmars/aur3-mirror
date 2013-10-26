# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=python2-espeak-bzr
_realname=python-espeak
pkgver=32
pkgrel=1
pkgdesc="Python2 bindings for eSpeak(development version)."
arch=('any')
url="https://launchpad.net/python-espeak"
license=('GPL3')
depends=('espeak' 'python2')
makedepends=('bzr')
conflicts=('python2-espeak')
provides=('python2-espeak')
source=($_realname::bzr+lp:$_realname)
md5sums=('SKIP')

pkgver() {
  cd $_realname
  bzr revno
}

package() {
  cd $srcdir/$_realname
  python2 setup.py install --root $pkgdir
}