# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: nale12@deviantart.com
pkgname=gtk-theme-boje
pkgver=1.2.0
pkgrel=1
pkgdesc="Boje Theme for gtk3, gtk2, gnome-shell, metacity, unity, xfwm4, openbox, cinnamon and emerald"
arch=('any')
url=('http://nale12.deviantart.com/art/Boje-1-2-0-342853818')
license="GPL"
depends=('gtk-engines' 'gnome-themes-standard>=3.6.0' 'gtk-engine-murrine>=0.98.2')
source=('https://dl.dropbox.com/s/85gc5lbh9dwp781/gtk-theme-boje.tar.bz2')
md5sums=('de31ef20c80c75bd7e3711c9d2301b1a')


package() {
	cd $srcdir
	tar xvf gtk-theme-boje.tar.bz2
	cp -R usr $pkgdir
}
