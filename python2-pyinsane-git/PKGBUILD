#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=python2-pyinsane-git
pkgver=v1.3.8.r10.g15f2d70
pkgrel=3
pkgdesc="Python implementation of the Sane API (using ctypes) and abstration layer."
arch=('i686' 'x86_64')
url="https://github.com/jflesch/pyinsane"
license=('GPL2')
provides=('python2-pyinsane')
conflicts=('python2-pyinsane')
makedepends=('python2')
depends=('sane')
#depends=('python2-gtk2' 'python2-glade2' 'python2-pycountry' 'python2-imaging' 'python2-poppler' 'python2-pyinsane' 'python2-pyocr')
source=('git+http://github.com/jflesch/pyinsane')
md5sums=('SKIP')

package() {
   cd $srcdir/pyinsane
  python2 ./setup.py install --root=$pkgdir  || return 1


}

