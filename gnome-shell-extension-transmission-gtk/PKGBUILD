#Maintainer: keshto[at]gmail
#Adapted by: franzrogar[at]gmail
pkgname=gnome-shell-extension-transmission-gtk
pkgver=0.1
pkgrel=2
pkgdesc="Extension to move the Transmission icon from the notification area (bottom bar) to the status area (top bar)."
url="http://mo.morsi.org/blog/node/337"
depends=('transmission-gtk' 'dbus-core' 'gnome-shell')
source=("http://superb-sea2.dl.sourceforge.net/project/pidgin-status/pidgin-status.tar.gz")
license=('GPL')
arch=('i686' 'x86_64')
md5sums=('d287b2f65404b02b058a831a6def7ad2')

build() {
 cd "$srcdir"
 mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/transmission.status@gnome-shell.morsi.org"
 cp -r "$srcdir/pidgin.status@gnome-shell.morsi.org"/* "$pkgdir/usr/share/gnome-shell/extensions/transmission.status@gnome-shell.morsi.org/"

 msg "Patching Transmission"
 cd "$pkgdir/usr/share/gnome-shell/extensions/transmission.status@gnome-shell.morsi.org"
 sed -i 's/pidgin/transmission-gtk/g' extension.js
 sed -i 's/main()/init()/g' extension.js
 sed -i 's/pidgin/transmission/g' metadata.json
 sed -i 's/Pidgin/Transmission/g' metadata.json
 sed -i 's/Messaging/Torrent/g' metadata.json
 sed -i 's/3.0.2/3.2.0/g' metadata.json
}
