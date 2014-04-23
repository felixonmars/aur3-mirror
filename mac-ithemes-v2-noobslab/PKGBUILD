#Maintainer: levi (levi0x0)
pkgname=mac-ithemes-v2-noobslab
pkgver=3.6
pkgrel=1
pkgdesc="ithemes (MAC OS) Themes GTK+/Cinnamon"
arch=('any')
url="https://launchpad.net/~noobslab/+archive/themes/"
license=('unknown')
source=('https://launchpad.net/~noobslab/+archive/themes/+files/mac-ithemes-v2-noobslab_3.6~saucy~NoobsLab.com.tar.gz')
md5sums=('caa5b2cade6ad150a0188cf28a0a4eb3')

package() {
	cd "$srcdir/MBuntu-themes"
	mkdir -p "$pkgdir/usr/share/themes"
	cp -r MB* "$pkgdir/usr/share/themes"
	chmod 755 -R "$pkgdir/usr/share/themes/"
}