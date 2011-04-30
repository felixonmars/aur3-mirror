# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: Mario Pastorelli <rief dot the dot dreamer at gmail dot com>

pkgname=dockbar
pkgver=0.25.1
pkgrel=1
pkgdesc="GNOME TaskBar with groupping and group manipulation."
arch=("i686" "x86_64")
url="http://gnome-look.org/content/show.php/DockBar?content=97822"
license=("GPL")
depends=('gnome-python' 'python-gnomeapplet' 'python-gnomedesktop'
         'python-metacity' 'python-rsvg' 'python-wnck' 'dbus-python'
         'python2-gconf' 'gnome-panel' 'gnome-panel-bonobo' 'python-notify')
source=("http://gnome-look.org/CONTENT/content-files/97822-$pkgname-$pkgver.tar.gz"
        python2_and_version.patch)
md5sums=('898e24d122398366518caf3fc7fb656a'
         '53aec9749a4e9ce3ac6cc76805c7f1eb')
sha1sums=('f3ebd8220c6ea2889e361bb7c3f406c3c152456a'
          'd5e279f89e12bd5fd53543b0abad75707c0f5d61')

build () {
	cd "$srcdir/$pkgver"
	patch -Nsp1 -i ../python2_and_version.patch
}

package() {
	cd "$srcdir/$pkgver"
	install -Ddm755 $pkgname "$pkgdir/usr/lib/$pkgname"
	install -Dm755 $pkgname/$pkgname.py "$pkgdir/usr/lib/$pkgname"
	install -Dm755 $pkgname/${pkgname}_pref.py "$pkgdir/usr/lib/$pkgname"
	install -Dm644 GNOME_DockBarApplet.server \
		"$pkgdir/usr/lib/bonobo/servers/GNOME_DockBarApplet.server"
	install -dm755 "$pkgdir/usr/bin"
	ln -s /usr/lib/dockbar/dockbar.py "$pkgdir/usr/bin/dockbar.py"
}

# vim: set ft=sh ts=3 sw=3 tw=0:
