# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>

pkgname=vpnc-svn
pkgver=517
pkgrel=2
pkgdesc="client for Cisco VPN concentrators"
arch=('i686' 'x86_64')
url="http://www.unix-ag.uni-kl.de/~massar/vpnc/"
license=('GPL')
depends=('libgcrypt' 'openssl' 'iproute2')
makedepends=('subversion')
provides=(vpnc)
conflicts=(vpnc)
backup=(etc/vpnc/default.conf)
source=(vpnc.conf)
md5sums=('a7302cf6a12bdc1eebdcbd10b2df0faf')

_svntrunk=http://svn.unix-ag.uni-kl.de/vpnc/trunk
_svnmod=vpnc

pkgver() {
	cd "${SRCDEST}/${_svnmod}"
	echo $(date +%F | tr -d -).$(svnversion)
}

build() {
  cd "$srcdir"

  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod && svn up
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  sed -i -e 's@/sbin@/usr/bin@g' vpnc-script
  
  # Build hybrid support
  sed -i 's|^#OPENSSL|OPENSSL|g' Makefile

  make PREFIX=/usr

}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install

  install -m755 "$srcdir/vpnc-build/vpnc-script" "$pkgdir/etc/vpnc/vpnc-script"
  install -m644 "$srcdir/vpnc.conf" "$pkgdir/etc/vpnc/default.conf"
  rm -f "$pkgdir/etc/vpnc/vpnc.conf"
}
