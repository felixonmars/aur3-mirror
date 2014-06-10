# Maintainer: David Spicer <azleifel at gmail dot com>

pkgname=vdr-vnsiserver-git
_gitname=vdr-plugin-vnsiserver
pkgver=20140517
pkgrel=1
pkgdesc="A VDR plugin to handle XBMC clients"
arch=('i686' 'x86_64')
url="http://xbmc.org/"
license=('GPL2')
depends=('vdr>=1.7.42')
makedepends=('git')
provides=('vdr-vnsiserver' 'vdr-plugin-vnsiserver')
conflicts=('vdr-vnsiserver' 'vdr-plugin-vnsiserver')
install=$pkgname.install
source=('git+https://github.com/FernetMenta/vdr-plugin-vnsiserver')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"

  # VDR directory environment
  _vdrCONFDIR="/var/lib/vdr"
  _vdrINCDIR="/usr/include"
  _vdrLIBDIR="/usr/lib/vdr"
  _vdrLOCDIR="/usr/share/locale"

  make DESTDIR="$pkgdir/" install

  # Get current plugin name
  _pluginname=$(grep "^PLUGIN =" Makefile | cut -d" " -f3)

  # Install configuration file
  install -d -m755 "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname"
  install -m644 "vnsiserver/allowed_hosts.conf" "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname"

  # Install documents
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  for _file in HISTORY README; do
    install -m644 $_file "$pkgdir/usr/share/doc/$pkgname"
  done

  # Set plugin name in install file
  sed "s/^PLUGIN_NAME=.*/PLUGIN_NAME=\"$_pluginname\"/" -i "${startdir}/$pkgname.install"

  # Set the backup array here as it depends on $_pluginname
  backup=("var/lib/vdr/plugins/$_pluginname/allowed_hosts.conf")
}
