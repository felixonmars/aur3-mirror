#Maintainer: M0Rf30

pkgname=gyp-svn
pkgver=r1976.28c0033
pkgrel=1
pkgdesc="GYP can Generate Your Projects."
url="http://code.google.com/p/gyp/"
arch=('i686' 'x86_64')   
makedepends=('subversion')
depends=('python2' 'python2-setuptools')
license=('custom')
#source=("gyp::git+https://github.com/svn2github/gyp.git")
source=("gyp::git+https://chromium.googlesource.com/external/gyp")

pkgver() {
  cd $srcdir/gyp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/gyp
  python2 setup.py install --root=$pkgdir
}

md5sums=('SKIP')
