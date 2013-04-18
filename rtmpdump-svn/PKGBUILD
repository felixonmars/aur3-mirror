# Contributor: Otakar Haška <ota.haska@seznam.cz>
pkgname=rtmpdump-svn
pkgver=569
pkgrel=1
pkgdesc="A tool to download rtmp:// and rtmpe:// streams"
arch=('i686' 'x86_64')
url="http://rtmpdump.mplayerhq.hu/"
license=('GPL')
depends=('openssl')
makedepends=('subversion' 'awk')
conflicts=('rtmpdump')
provides=('rtmpdump')
source=()
md5sums=()

_svntrunk='svn://svn.mplayerhq.hu/rtmpdump/trunk'
_svnmod='rtmpdump'

pkgver() {
  cd "$srcdir/$_svnmod"
  svn info $_svntrunk | grep Revision | awk '{print $2}'
}

build() {
  cd $srcdir  
  msg "Updating SVN entries for $_svnmod ..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "Finished update, starting build ..."
  cp -r $_svnmod $_svnmod-build
  
  cd $_svnmod-build  
  make prefix=usr || return 1
}

package() {
cd $srcdir/$_svnmod-build
 chmod 755 $pkgdir
  mkdir -p $pkgdir/usr/{lib/pkgconfig,include,man}
  make prefix=$pkgdir/usr install
}