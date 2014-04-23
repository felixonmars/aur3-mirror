#Maintainer: levi (levi0x0)

pkgname=mac-icons-v2-noobslab
pkgver=3.6
pkgrel=1
pkgdesc="MAC OS Icons/Cursors by NoobSlab"
arch=('any')
url="https://launchpad.net/~noobslab/+archive/themes/"
license=('unknown')
source=('https://launchpad.net/~noobslab/+archive/themes/+files/mac-icons-v2-noobslab_3.6~saucy~NoobsLab.com.tar.gz')
md5sums=('8ab8e2bec875a3b3c06ee9d967ea538e')

package() {
	cd "$srcdir/MBuntu-icons"
	mkdir -p "$pkgdir/usr/share/icons"
	cp -r MB* "$pkgdir/usr/share/icons"
	cp -r mac-cursors "$pkgdir/usr/share/icons/"
	chmod 755 -R "$pkgdir/usr/share/icons/"
}
