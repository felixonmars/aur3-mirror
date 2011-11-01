# Maintainer: Shanto <shanto@hotmail.com>

pkgname=gnome-shell-extension-places-menu-extended
pkgdesc="Extends the official Places Menu extension with some useful additional items and actions"
pkgver=1.5.4
pkgrel=1
arch=(any)
url="http://opendesktop.org/content/show.php/Extended+Places+Menu+Extension?content=146113"
license=(GPL2)
depends=(dconf python2)
source=(http://opendesktop.org/CONTENT/content-files/146113-extend-places-${pkgver}.tar.gz)
md5sums=('1b44c528f31e463f371f5cb494d102c7')
install=$pkgname.install

build() {
	cd "$srcdir/extend-places-$pkgver"

	_extname=places-menu-extended@wdt.developers.gmail.com
	bin_dir="$pkgdir/usr/bin/"
	doc_dir="$pkgdir/usr/share/doc/$pkgname"
	gshellx_dir="$pkgdir/usr/share/gnome-shell/extensions/$_extname"
	gschema_dir="$pkgdir/usr/share/glib-2.0/schemas"
	polkit_dir="$pkgdir/usr/share/polkit-1/actions/"

	mkdir -p $bin_dir
	mkdir -p $doc_dir
	mkdir -p $gschema_dir
	mkdir -p $gshellx_dir
	mkdir -p $polkit_dir
	
	sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" epmupdater

	install -m0755 epmupdater $bin_dir
	install -m0644 First-Install Update $doc_dir
	install -m0644 org.gnome.shell.extensions.places-menu-extended.gschema.xml $gschema_dir
	install -m0644 $_extname/*.{js,json,css} $gshellx_dir
	install -m0644 org.freedesktop.policykit.pkexec.nautilus-run.policy $polkit_dir
}
