# Contributor: nesl247 <nesl247@gmail.com>

pkgname=libwpad-svn
pkgver=23
pkgrel=2
pkgdesc="Library, bindings and command-line utilities to automatically detect \
        and configure client proxy settings"
arch=(i686)
url="http://code.google.com/p/wpad"
license=('LGPL')
depends=('xulrunner' 'python>=2.4.0' 'nspr')
makedepends=('subversion' 'libtool' 'pkgconfig')
provides=('libwpad')
conflicts=('spidermonkey')
source=()
md5sums=()
_svntrunk=http://wpad.googlecode.com/svn/trunk/
_svnmod=libwpad

build() {
  # start building
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  sed -i -e 's|firefox-js|xulrunner-js|g' configure.ac
  autoreconf -i || return 1

  ./configure --prefix=/usr
  make LDFLAGS+="-R /opt/mozilla/lib/xulrunner" || return 1
  make DESTDIR=$startdir/pkg install || return 1
  
  rm -rf $startdir/src/$_svnmod-build 
}
