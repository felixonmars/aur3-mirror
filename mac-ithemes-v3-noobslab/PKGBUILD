#Maintainer: lordwelch
pkgname=mac-ithemes-v3-noobslab
pkgver=3.12
pkgrel=1
pkgdesc="ithemes (MAC OS) Themes GTK+/Cinnamon"
arch=('any')
url="https://launchpad.net/~noobslab/+archive/themes/"
license=('unknown')
source=('https://launchpad.net/~noobslab/+archive/ubuntu/themes/+files/mac-ithemes-v3_3.12-c%7Etrusty%7ENoobsLab.com.tar.gz')
md5sums=('7ec8b56de7f0c5e3371386fb6d801eb6')

package() {
	cd "$srcdir/Mbuntu-themes"
	mkdir -p "$pkgdir/usr/share/themes"
	cp -r Mb* "$pkgdir/usr/share/themes"
	chmod 755 -R "$pkgdir/usr/share/themes/"
}
