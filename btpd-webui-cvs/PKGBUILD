# Contributor: Vajdics Balázs <b.vajdics@gmail.com>

pkgname=btpd-webui-cvs
pkgver=16
pkgrel=1
pkgdesc="A simple webui for the Bittorrent Protocol Daemon"
arch=('i686' 'x86_64')
url="http://code.google.com/p/btpd-webui/"
depends=('python' 'twisted' 'btpd')
makedepends=('subversion')
source=()
license=('GPL')
md5sums=()

_svntrunk=http://btpd-webui.googlecode.com/svn/trunk
_svnmod=btpd-webui-read-only

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python setup.py install --root=${pkgdir}

  rm -rf $startdir/src/$_svnmod-build

}

