# Contributor: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>

pkgname=sleakblue-gtk-theme
pkgver=0.6
pkgrel=1
pkgdesc="A gtk theme based somewhat on the theme from MS Office 2007"
arch=('any')
url="http://gnome-look.org/content/show.php/Sleak+Blue?content=103150"
license=('GPL')
source=("http://gnome-look.org/CONTENT/content-files/103150-SleakBlue.tar.gz")
md5sums=('03ccb1f34a8e376fb2b11b890e695b5c')

build() {
	install -d -m755 $pkgdir/usr/share/themes/SleakBlue
	cd $srcdir/SleakBlue
	cp -R * $pkgdir/usr/share/themes/SleakBlue/
	find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
	find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
}
