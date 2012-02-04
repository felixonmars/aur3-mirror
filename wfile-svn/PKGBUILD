# Contributor: Shawn Dellysse <sdellysse@radford.edu>

pkgname=wfile-svn
pkgver=31
pkgrel=2
pkgdesc='A wrapper around /usr/bin/file which calls 'which' on each argument'
url='http://code.google.com/p/sdellysse/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'which' 'file')
makedepends=('subversion')
conflicts=('wfile')
provides=('wfile')

source=()
md5sums=()

_svntrunk=http://sdellysse.googlecode.com/svn/trunk/wfile
_svnmod=wfile

build(){
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  
  install -d -m755 $pkgdir/usr/bin
  install -m755 $srcdir/$_svnmod/wfile $pkgdir/usr/bin
}