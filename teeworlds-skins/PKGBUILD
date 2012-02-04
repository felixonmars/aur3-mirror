# Maintainer: andy123 <ajs[at]online[dot]de>

pkgname=teeworlds-skins
pkgver=1
pkgrel=1
url="http://www.teeworlds.com/forum/viewtopic.php?id=2662"
pkgdesc="Skins for teeworlds"
arch=('any')
license=('public-domain')
#depends=('teeworlds')
makedepends=('unzip' 'teeworlds')
source=('http://pixelbanane.de/yafu/3663042393/Raphaei+Skin+Pack.zip'
	'http://pixelbanane.de/yafu/238684956/skins.zip')
sha256sums=('f244f28c9960fdea4ccdc93546ba2371bab2d2cf08bbf5ddb37955d11f6f0038'
	    '12d9d585aef220b29f516fe346d94677ba521502ce15732b271efe78e5b9a0fa')

package() {
	cd $srcdir/
	mkdir -p $pkgdir/usr/share/teeworlds/data/
	unzip Raphaei+Skin+Pack.zip -d $pkgdir/usr/share/teeworlds/
	unzip -o skins.zip -d $pkgdir/usr/share/teeworlds/data/
	rm -r $pkgdir/usr/share/teeworlds/data/__MACOSX
	for png in $(pacman -Ql teeworlds | egrep -o /usr/share/teeworlds/data/skins/'.*[^\.]+\.png'); do
		rm ${pkgdir}${png}
	done
}
