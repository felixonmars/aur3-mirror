# Maintainer: Steef435 <steefhegeman at hotmail dot com>
# Maintainer note: If for some reason I have forgotten about this package, shoot me an e-mail and I'll gladly disown it

pkgname=ultra-flat-gtk
pkgver=1.2
pkgrel=1
pkgdesc='A slightly modified version of the famous Numix theme, with no border, flat rounded window buttons and grey selection colour'
arch=('any')
url='http://gnome-look.org/content/show.php/Ultra-Flat?content=167473'
license=('GPL3')
depends=('gtk-engine-murrine')
source=('https://www.dropbox.com/s/bx42h8a1o48w7e0/Ultra-Flat-Theme.tar.gz')
sha256sums=('eb8c300b1d543dc4df5d1f458ca1728d6420ac8e8311d28be9f2dfeea09cb93a')

package() {
	cd Ultra-Flat

	install -dm 755 "$pkgdir"/usr/share/themes/Ultra-Flat
	rm -rf .git CREDITS LICENSE
	cp -dr --no-preserve='ownership' * "$pkgdir"/usr/share/themes/Ultra-Flat/
}
