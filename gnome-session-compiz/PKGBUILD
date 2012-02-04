# Maintainer: Shanto <shanto@hotmail.com>
pkgname=gnome-session-compiz
pkgver=3.2
pkgrel=2
pkgdesc="GDM session definition/menu entry for GNOME 3, with Compiz as Window Manager and Cairo-Dock as Taskbar/Panel."
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
groups=('gnome-extra')
depends=('compiz-core' 'cairo-dock' 'gnome-session' 'notification-daemon')
optdepends=('emerald')
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
md5sums=('f9049a391cde4153c3913787ff222efb'
         '606150a99fb591edf9472fe425764828'
         'db866950211fcb138863c0777b59bfec')

