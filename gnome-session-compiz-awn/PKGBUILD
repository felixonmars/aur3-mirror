# Maintainer: Shanto <shanto@hotmail.com>
pkgname=gnome-session-compiz-awn
pkgver=1.0
pkgrel=1
pkgdesc="GDM session definition/menu entry for GNOME 3, with Compiz as Window Manager and Avant Window Navigator as Taskbar/Panel."
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
groups=('gnome-extra')
depends=('compiz-core' 'avant-window-navigator' 'gnome-session' 'notification-daemon')
#install=$pkgname.install
source=('gnome-compiz.session'
	'gnome-compiz.desktop'
	'compiz.desktop')
package() {
	cd "$srcdir"
	install -m755 -d "$pkgdir"/usr/share/{gnome-session/sessions,xsessions,applications}/
	install -m644 gnome-compiz.session "$pkgdir"/usr/share/gnome-session/sessions/
	install -m644 gnome-compiz.desktop "$pkgdir"/usr/share/xsessions/
	install -m644 compiz.desktop "$pkgdir"/usr/share/applications/
}
md5sums=('2aa4a6505f50a95ee6e7dadfc771210c'
         '606150a99fb591edf9472fe425764828'
         'ffa56bc5dd8b50d90465eec783efd08b')

