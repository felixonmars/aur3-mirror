# Contributor: dir <boypansit@gmail.com>
pkgname=fcgi-mono-svn
pkgver=1533
pkgrel=1
pkgdesc="FastCGI & Mono: ASP.NET Server on Linux"
arch=(i686)
depends=('mono' 'fcgi')
license=('MIT')
source=()
md5sums=()
url="http://mono-soc-2007.googlecode.com"
_svntrunk=http://mono-soc-2007.googlecode.com/svn/trunk/brian/FastCgi
_svnmod=fastcgi-mono-server

build() {
  cd $startdir/src
  
  svn co $_svntrunk $_svnmod --config-dir ./ -r $pkgver
       
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  export MONO_SHARED_DIR=/tmp/fakeroot-wapi  
  mkdir /tmp/fakeroot-wapi
  
  ./autogen.sh --prefix=/usr

  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -rf /tmp/fakeroot-wapi
}
