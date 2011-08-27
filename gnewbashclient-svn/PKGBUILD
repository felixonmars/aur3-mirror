# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=gnewbashclient-svn
pkgver=1
pkgrel=1
pkgdesc="A bash client for gNewBook"
url="http://code.fundaciongnuchile.cl/indefero/index.php/p/gnewbashclient/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('curl')
makedepends=('subversion')
conflicts=()

_svntrunk='http://code.fundaciongnuchile.cl/gnewbashclient'
_svnmod='gNewBashClient'

build() {

  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
  else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

      msg "SVN checkout done or server timeout"
      msg "Starting make..."

  if [ -d $srcdir/$_svnmod-build ]; then
      rm -r $srcdir/$_svnmod-build
  fi

      cd ${srcdir}/${_svnmod}/${_svnmod}

      install -Dm755 ${_svnmod}.sh $pkgdir/usr/bin/gnewbashclient || return 1

}