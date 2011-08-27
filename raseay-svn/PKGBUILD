# Maintainer: Kacper Żuk <kazuldur@gmail.com
pkgname=raseay-svn
pkgver=20110503
pkgrel=1
pkgdesc="Simple strategy game written in Python"
arch=('any')
url="http://code.google.com/p/raseay"
license=('MIT')
depends=('python2' 'python-pygame')
makedepends=('subversion')
source=('raseay.sh')
md5sums=('1fceb85055fccd1dd28bf04939f5d107')

build() {
  cd "$srcdir/"
  if [ -e "raseay-svn" ]; then
    rm -r raseay-svn
  fi
  svn export http://raseay.googlecode.com/svn/trunk/ raseay-svn
}

package() {
  cd "$srcdir/"
  mkdir -p $pkgdir/usr/share
  cp -r raseay-svn $pkgdir/usr/share/raseay
  install -D raseay.sh $pkgdir/usr/bin/raseay
}
