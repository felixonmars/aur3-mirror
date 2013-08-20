# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=word2vec
pkgdesc="Tool for computing continuous distributed representations of words"
pkgver=32
pkgrel=1
url="http://code.google.com/p/word2vec/"
arch=('i686' 'x86_64')
license=('Apache')
depends=('glibc')
makedepends=('subversion')
source=("svn+http://${pkgname}.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/trunk"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/trunk"
  make
}

package() {
  cd "$srcdir/trunk"

  install -d "$pkgdir/usr/bin"
  install -m755 word2vec word2phrase distance word-analogy compute-accuracy "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/lib/$pkgname"

  sed -e 's$.*\./$$g' -i *.sh
  install -m755 *.sh "$pkgdir/usr/lib/$pkgname"
}

