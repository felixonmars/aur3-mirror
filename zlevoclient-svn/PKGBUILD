
# Contributor: imagelife <lovelinux229@gmail.com>
pkgname=zlevoclient-svn
pkgver=45
pkgrel=1
pkgdesc="lenovo 802.1x supplicant for linux."
arch=('i686' 'x86_64')
url="http://code.google.com/p/zlevoclient/"
license=('MIT')
depends=('libpcap')
makedepends=('subversion')
provides=('zlevoclient')
conflicts=('zlevoclient')
source=()
md5sums=() 

_svntrunk=http://zlevoclient.googlecode.com/svn/trunk/
_svnmod="zlevoclient"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  make || return 1
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/doc/zlevoclient

  install -D -m755 zlevoclient "$pkgdir/usr/bin"
  install -D -m755 zlevo_run.sh "$pkgdir/usr/bin"
  install -D -m644 Readme.txt  "$pkgdir/usr/share/doc/zlevoclient"
}
