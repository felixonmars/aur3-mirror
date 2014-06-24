# Contributor: Brandon Ednes <brandon@as220.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jdee-svn
pkgver=300
_pkgver=2.4.2
pkgrel=1
pkgdesc="Java Development Environment for Emacs"
arch=('any')
url="http://jdee.sourceforge.net/"
license=('GPL')
depends=('emacs-elib' 'java-environment')
makedepends=('subversion' 'apache-ant-contrib')
provides=('jdee')
conflicts=('jdee')
source=("svn+https://jdee.svn.sourceforge.net/svnroot/jdee/trunk/jdee")
md5sums=('SKIP')
_svnmod="jdee"

pkgver() {
  cd "$srcdir/${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $srcdir/${_svnmod}
  ant clean-all
  ant configure
  ant bindist
}

package() {
  cd $srcdir/${_svnmod}/dist/jdee-${_pkgver}
  install -d $pkgdir/usr/share/java/jdee/{lisp,java/lib}
  cp -r java/lib/ $pkgdir/usr/share/java/jdee/java/
  cp -r lisp/ $pkgdir/usr/share/java/jdee/
}
