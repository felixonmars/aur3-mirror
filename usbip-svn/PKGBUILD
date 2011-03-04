# Contributor: Yarrema aka Knedlyk <yupadmin@gmail.com>
_pkgname=usbip
pkgname=${_pkgname}-svn
pkgver=167
pkgrel=1
pkgdesc="A general USB device sharing system over IP network"
arch=(i686 x86_64)
url="http://usbip.sourceforge.net/"
license=('GPL')
depends=('sysfsutils' 'tcp_wrappers' 'glib2')
options=('!libtool')
source=()
md5sums=()

_svntrunk="https://usbip.svn.sourceforge.net/svnroot/usbip" 
_svnmod="usbip"

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_svnmod}-build
  cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build/linux/trunk/src

  ./autogen.sh || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
