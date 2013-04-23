# Maintainer: David Spicer <azleifel at gmail dot com>

pkgname=vdr-vnsiserver-frodo-git
_pluginname=vnsiserver3
_gitname=xbmc-pvr-addons-frodo
pkgver=20130415
pkgrel=1
pkgdesc="A VDR plugin to handle XBMC clients (frodo branch)"
arch=('i686' 'x86_64')
url="http://xbmc.org/"
license=('GPL2')
depends=('vdr>=1.7.42')
makedepends=('git')
provides=('vdr-vnsiserver' 'vdr-plugin-vnsiserver')
conflicts=('vdr-vnsiserver' 'vdr-plugin-vnsiserver')
backup=('var/lib/vdr/plugins/vnsiserver3/allowed_hosts.conf')
install=$pkgname.install
source=("$_gitname::git+https://github.com/opdenkamp/xbmc-pvr-addons.git#branch=frodo")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$_gitname/addons/pvr.vdr.vnsi/vdr-plugin-vnsiserver"

  make
}

package() {
  cd "$srcdir/$_gitname/addons/pvr.vdr.vnsi/vdr-plugin-vnsiserver"

  # VDR directory environment
  _vdrCONFDIR="/var/lib/vdr"
  _vdrINCDIR="/usr/include"
  _vdrLIBDIR="/usr/lib/vdr"
  _vdrLOCDIR="/usr/share/locale"

  make DESTDIR="$pkgdir/" install

  # Install configuration file
  install -d -m755 "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname"
  install -m644 "vnsiserver/allowed_hosts.conf" "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname"

  # Install documents
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  for _file in HISTORY README; do
    install -m644 $_file "$pkgdir/usr/share/doc/$pkgname"
  done
}
