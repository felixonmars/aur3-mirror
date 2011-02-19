# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=ess-svn
pkgver=4461
pkgrel=1
pkgdesc="Emacs Speaks Statistics: A Universal Interface for \
 Statistical Analysis - svn-version"
arch=('any')
url="http://ess.r-project.org/"
license=('GPL')
depends=('emacs' 'r')
makedepends=('subversion' 'perl')
provides=('ess')
conflicts=('ess')
install=ess.install
options=('docs')
source=()
md5sums=()

_svntrunk=https://svn.r-project.org/ESS/trunk/
_svnmod=ess

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd ${_svnmod} && svn up -r $pkgver)
  else
    svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  #
  # BUILD
  #
  cd $srcdir/ess
  make prefix=/usr
}

package() {
  cd $srcdir/ess
  make DESTDIR=$pkgdir/usr LISPDIR=$pkgdir/usr/share/emacs/site-lisp/ess \
    INFODIR=$pkgdir/usr/share/info/ install 
}
