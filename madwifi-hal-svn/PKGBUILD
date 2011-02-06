# Contributor: simo91 <simo91.linux@gmail.com>
# Contributor: Kristaps Esterlins <kristaps.esterlins@gmail.com>

pkgname=madwifi-hal-svn
pkgver=4119
pkgrel=1
pkgdesc="Madwifi drivers for Atheros wireless chipsets. HAL testing branch."
arch=('i686' 'x86_64')
url="http://madwifi-project.org/"
license=('GPL')
depends=('wireless_tools' 'madwifi-utils')
makedepends=('subversion')
provides=("madwifi")
conflicts=("madwifi")
install=madwifi.install

_kernver=$(uname -r)
_svntrunk=http://madwifi-project.org/svn/madwifi/branches/madwifi-hal-testing
_svnmod=madwifi

build()
{
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    msg "svn update..."
    cd $_svnmod
    svn up -r $pkgver || return 1
  else
    msg "svn checkout..."
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
    cd $_svnmod
  fi

  msg "make install-modules..."
  KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver DESTDIR="$pkgdir" make install-modules || return 1
}
