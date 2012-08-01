# Maintainer: ktalog <thektalog@gmail.com>
# Contributor: Shanto <shanto@hotmail.com>

pkgname=cinnamon-extension-places-menu-extended
pkgdesc="Extends the official Places Menu extension with some useful additional items and actions"
pkgver=1.5.4
pkgrel=5
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
	cinnamonx_dir="$pkgdir/usr/share/cinnamon/extensions/$_extname"
	gschema_dir="$pkgdir/usr/share/glib-2.0/schemas"
	polkit_dir="$pkgdir/usr/share/polkit-1/actions/"

	mkdir -p $bin_dir
	mkdir -p $gschema_dir
	mkdir -p $cinnamonx_dir
	mkdir -p $polkit_dir
	
	sed -i 's|shell-version|cinnamon-version|' "$_extname/metadata.json"
	sed -i 's|"3.2.0", "3.2"|"1.2", "1.3", "1.3.1", "1.4", "1.5.0", "1.5.2"|' "$_extname/metadata.json"
	
	sed -i 's|org.gnome.shell|org.cinnamon|' "$_extname/extension.js"
	sed -i 's|Shell|Cinnamon|' "$_extname/extension.js"
	sed -i 's|imports.gi.Shell|imports.gi.Cinnamon|' "$_extname/extension.js"
	sed -i 's|Main.PlaceDisplay|Main.placesManager|' "$_extname/extension.js"
	sed -i '/const Panel = imports.ui.panel;/ a\const PlacesManager = imports.ui.placesManager;' "$_extname/extension.js"
	sed -i 's|Main.placesManager.PlaceInfo|PlacesManager.PlaceInfo|' "$_extname/extension.js"
	sed -i 's|epmupdater|cepmupdater|' "$_extname/extension.js"	
	
	mv epmupdater cepmupdater
	sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" cepmupdater
	sed -i "s|org.gnome.shell|org.cinnamon|" cepmupdater
	#patch cepmupdater to fix : if no action define in 'actions list' then you don't see anything on 'ssh list'
	sed -i '/checklist2 = settings/ D' cepmupdater
	sed -i '/if checklist2/ i\ \n    def getConfigFile2(self): \n        checklist2 = settings["ssh-list"]' cepmupdater
	sed -i '/self.configuration.getConfigFile()/ a\        self.configuration.getConfigFile2()' cepmupdater
	
	
	mv org.gnome.shell.extensions.places-menu-extended.gschema.xml org.cinnamon.extensions.places-menu-extended.gschema.xml
	sed -i 's|gnome-shell-extensions|cinnamon-extensions|' org.cinnamon.extensions.places-menu-extended.gschema.xml
	
	sed -i 's|/org/gnome/shell/extensions/|/org/cinnamon/extensions/|' org.cinnamon.extensions.places-menu-extended.gschema.xml
	sed -i 's|org.gnome.shell.extensions|org.cinnamon.extensions|' org.cinnamon.extensions.places-menu-extended.gschema.xml
	

	install -m0755 cepmupdater $bin_dir
	#uncomment this 2 lines if you want doc file but you need to adapt it to cinnamon
	#mkdir -p $doc_dir
	#install -m0644 First-Install Update $doc_dir
	install -m0644 org.cinnamon.extensions.places-menu-extended.gschema.xml $gschema_dir
	install -m0644 $_extname/*.{js,json,css} $cinnamonx_dir
	install -m0644 org.freedesktop.policykit.pkexec.nautilus-run.policy $polkit_dir/org.freedesktop.policykit.pkexec.nautilus-run.cinnamon.policy
}
