# Contributor: h31 <h31mail@yandex.com
pkgname=qutim-protocol-msn-svn
pkgver=5
pkgrel=1
pkgdesc="Adds support for the Windows Live Messenger (also knows as MSN) protocol to Qutim. SVN version"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim-svn' 'openssl')
makedepends=('subversion' 'gcc' 'make' 'cmake')
provides=('qutim-plugin-msn-svn')
conflicts=('qutim-plugin-msn-svn')

_svnmod=msn
_svntrunk=http://qutim.org/svn/$_svnmod

build() {
msg "Downloading from $_svntrunk ..."
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg2 "SVN checkout done or server timeout"

msg "Creating temporary build directory..."
  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $srcdir/$_svnmod-build

msg "Building and installing..."  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

msg "Removing temporary files..."
  rm -rf $_svnmod-build
}
