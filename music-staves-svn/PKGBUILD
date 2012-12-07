# Maintainer: Quentin Stievenart <acieroid@awesom.eu>

pkgname=music-staves-svn
pkgver=4
pkgrel=1
pkgdesc="Gamera toolkit for experimenting with different methods for staff removal from digital images of sheet music."
arch=('i686' 'amd64')
url="http://gamera.informatik.hsnr.de/"
license=('GPL')
depends=('python2' 'gamera-svn')
makedepends=('svn' 'gcc')
provides=('music-staves')
conflicts=('music-staves')

_svntrunk="https://gamera.svn.sourceforge.net/svnroot/gamera/trunk/gamera"
_svntrunk="https://music-staves.svn.sourceforge.net/svnroot/music-staves"
_svnmod=music-staves

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd $_svnmod
  python2 setup.py build
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}

