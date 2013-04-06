# Maintainer: David Spicer <azleifel at gmail dot com>

pkgname=vdr-streamdev-git
_pluginname=streamdev
_gitname=vdr-plugin-streamdev
pkgver=20130319
pkgrel=1
pkgdesc="VDR server and client plugins that implement the Video Transfer Protocol (VTP)"
arch=('i686' 'x86_64')
url="http://projects.vdr-developer.org/projects/plg-streamdev"
license=('GPL2')
depends=('vdr>=1.7.42')
makedepends=('git')
provides=('vdr-streamdev')
conflicts=('vdr-streamdev')
backup=('var/lib/vdr/plugins/streamdev-server/streamdevhosts.conf')
install=$pkgname.install
source=('git://projects.vdr-developer.org/vdr-plugin-streamdev.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$_gitname"

  make all
}

package() {
  cd "$srcdir/$_gitname"

  # VDR directory environment
  _vdrCONFDIR="/var/lib/vdr"
  _vdrINCDIR="/usr/include"
  _vdrLIBDIR="/usr/lib/vdr"
  _vdrLOCDIR="/usr/share/locale"

  make DESTDIR="$pkgdir/" install

  # Install configuration etc. files
  install -d -m755 "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname-server"
  install -m755 $_pluginname-server/externremux.sh "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname-server"
  install -m644 $_pluginname-server/streamdevhosts.conf "$pkgdir/$_vdrCONFDIR/plugins/$_pluginname-server"

  # Install documents
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  for _file in CONTRIBUTORS HISTORY PROTOCOL README; do
    install -m644 $_file "$pkgdir/usr/share/doc/$pkgname"
  done
}
