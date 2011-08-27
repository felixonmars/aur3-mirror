# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-protocol-irc-svn
pkgver=38
pkgrel=1
pkgdesc="Adds support for the IRC protocol to Qutim. SVN version"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim-svn')
makedepends=('subversion' 'gcc' 'make')
provides=('qutim-plugin-irc-svn')
replaces=('qutim-plugin-irc-svn')
conflicts=('qutim-plugin-irc-svn')

_svnmod=irc
_svntrunk=http://qutim.org/svn/$_svnmod/

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
  cp -r $_svnmod/trunk $_svnmod-build
  cd $_svnmod-build

msg "Building and installing..."
  qmake || return 1
  make || return 1

  cd $srcdir
  install -Dm 644 $_svnmod-build/libirc.so $pkgdir/usr/lib/qutim/libirc.so || return 1

msg "Removing temporary files..."
  rm -rf $_svnmod-build
}
