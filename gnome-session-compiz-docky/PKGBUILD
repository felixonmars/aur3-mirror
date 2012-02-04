# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=gnome-session-compiz-docky
pkgver=1.0
pkgrel=1
pkgdesc="GDM session definition/menu entry for GNOME 3, with Compiz as Window Manager and docky as Taskbar/Panel."
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
groups=('gnome-extra')
depends=('compiz-core' 'docky' 'gnome-session' 'notification-daemon')
optdepends=('emerald')
conflicts=('gnome-session-compiz')
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

md5sums=('b10cc67dd23048a09e4a6b121946b2f2'
         '606150a99fb591edf9472fe425764828'
         'db866950211fcb138863c0777b59bfec')
