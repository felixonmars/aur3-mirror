# Maintainer: Edvard Holst <edvard.holst at gmail> 

pkgname=python2-pyand-git
pkgver=0.9.1.2
pkgrel=4
pkgdesc="A Python wrapper library for ADB and Fastboot"
arch=('i686' 'x86_64')
url="https://github.com/Zyg0te/pyand"
license=('MIT')
depends=('pacman' 'python2' 'python-setuptools')
makedepends=('git')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source=($pkgname::git+'https://github.com/Zyg0te/pyand.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  export PYTHONPATH="$pkgdir/usr/lib/python2.7/site-packages"
  cd $srcdir/$pkgname/../
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages
  easy_install-2.7 --prefix "$pkgdir/usr" python2-pyand-git
}

