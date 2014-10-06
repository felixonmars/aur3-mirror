# Maintainer: DeadSurgeon42 <deadsurgeon42 at gmail dot com>
# Contributor: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: nale12@deviantart.com
pkgname=gtk-themes-boje
pkgver=1.2.1
pkgrel=2
pkgdesc="Boje Theme for gtk3, gtk2, gnome-shell, metacity, unity, xfwm4, openbox, cinnamon and emerald"
arch=('any')
url=('http://nale12.deviantart.com/art/Boje-1-2-1-342853818')
license="GPL"
depends=('gtk-engine-murrine>=0.98.2')
source=('http://sidekick.klndrt.net/boje_1_2_1_by_nale12-d5o4jp6.zip')
md5sums=('07e02eb76b1fa0212264733e343786e5')


package() {
	mkdir -p $pkgdir/usr/share/themes/
	cp -R $srcdir/* $pkgdir/usr/share/themes/
}
