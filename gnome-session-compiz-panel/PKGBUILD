# Maintainer: ptaack <ptaack@gmail.com>
pkgname=gnome-session-compiz-panel
pkgver=3.2
pkgrel=1
pkgdesc="GDM session definition/menu entry for GNOME 3, with Compiz as Window Manager and Gnome Panel."
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
conflicts=('gnome-session-compiz' 'gnome-session-compiz-awn' 'gnome-session-compiz-docky')
groups=('gnome-extra')
depends=('compiz-core' 'gnome-panel' 'gnome-session' 'notification-daemon')
optdepends=('emerald' 'ccsm')

install=$pkgname.install

source=('bluetooth-applet.desktop'
	'compiz.desktop'
	'gnome-compiz.desktop'
	'gnome-compiz.session'
	'gnome-fallback-mount-helper.desktop'
	'gnome-sound-applet.desktop')

backup=('etc/xdg/autostart/bluetooth-applet.desktop'
	'etc/xdg/autostart/gnome-fallback-mount-helper.desktop'
	'etc/xdg/autostart/gnome-sound-applet.desktop')

package() {
	cd "$srcdir"
	install -m755 -d "$pkgdir"/usr/share/{gnome-session/sessions,xsessions,applications}/
	install -m644 $srcdir/gnome-compiz.session "$pkgdir"/usr/share/gnome-session/sessions/
	install -m644 $srcdir/gnome-compiz.desktop "$pkgdir"/usr/share/xsessions/
	install -m644 $srcdir/compiz.desktop "$pkgdir"/usr/share/applications/
	mkdir -p $pkgdir/etc/xdg/autostart/
	install -m644 $srcdir/bluetooth-applet.desktop "$pkgdir"/etc/xdg/autostart/
	install -m644 $srcdir/gnome-fallback-mount-helper.desktop "$pkgdir"/etc/xdg/autostart/
	install -m644 $srcdir/gnome-sound-applet.desktop "$pkgdir"/etc/xdg/autostart/
}

md5sums=('d89be1cfc6c18ada742334b99661d5a4'
	 'db866950211fcb138863c0777b59bfec'
	 'c0b0d7a969ab6465f5a5afbca5856015'
	 '96bc6758a1a59fbeb6b30112979fabb9'
	 'a6578b4775aecf0c153586dbb3e8d8b0'
	 '02b77f249328be79e8facca55cf05f99')


