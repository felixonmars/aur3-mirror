# Maintainer: Max Roder <maxroder AT web DOT de>
pkgname=netdiscover-svn
pkgver=106
pkgrel=2
pkgdesc="Netdiscover is an active/passive address reconnaissance tool, mainly developed for those wireless networks without dhcp server, when you are wardriving. It can be also used on hub/switched networks."
arch=('i686' 'x86_64')
url="http://nixgeneration.com/~jaime/netdiscover/"
license=('GPL')
depends=('libnet' 'libpcap')
makedepends=('subversion')
conflicts=(netdiscover)
provides=(netdiscover)

_svntrunk="https://netdiscover.svn.sourceforge.net/svnroot/netdiscover/trunk"
_svnmod="netdiscover"


build() {
  msg "Downloading from ${_svntrunk} ..."
  cd ${srcdir}
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  msg2 "SVN checkout done or server timeout"

  msg "Creating temporary build directory..."
  rm -Rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  msg "Building and installing..."  
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc || return 1

  # Update mac vendor database
  chmod +x update-oui-database.sh
  ./update-oui-database.sh

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_svnmod}-build
}
