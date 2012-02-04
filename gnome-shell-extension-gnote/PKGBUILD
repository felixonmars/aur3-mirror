# Contributor: Alois Nespor <info@aloisnespor.info>

pkgname=gnome-shell-extension-gnote
pkgver=3.0.2
_date=20110705
pkgrel=0.${_date}.1
arch=(any)
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=(GPL2)
pkgdesc="Move Gnote from Message Tray to Status Tray"
depends=(gnome-shell)
makedepends=(gnome-shell intltool)
install=($pkgname.install)
source=(http://www.fpmurphy.com/gnome-shell-extensions/gnote.tar.gz)
sha256sums=('28047e214117e962fb28231aeb66a78bd69f959c1794e9cbc1f176de7af6061a')

build() {

 cd $srcdir 
 mkdir -p $pkgdir/usr/share/gnome-shell/extensions/gnote@fpmurphy.com
  cp -r gnote@fpmurphy.com $pkgdir/usr/share/gnome-shell/extensions/
}



