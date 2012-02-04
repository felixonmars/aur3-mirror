# Contributor: Shawn Dellysse <sdellysse@radford.edu>

pkgname=wcat-svn
pkgver=30
pkgrel=1
pkgdesc='A wrapper around /bin/cat which calls 'which' on each argument'
url='http://code.google.com/p/sdellysse/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'which' 'coreutils')
makedepends=('subversion')
conflicts=('wcat')
provides=('wcat')

source=()
md5sums=()

_svntrunk=http://sdellysse.googlecode.com/svn/trunk/wcat
_svnmod=wcat

build(){
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  
  install -d -m755 $pkgdir/usr/bin
  install -m755 $srcdir/$_svnmod/wcat $pkgdir/usr/bin
}