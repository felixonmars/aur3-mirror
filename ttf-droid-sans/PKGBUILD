# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Vladyslav Chyzhevskyi <coirius@coirius.com>

pkgname=ttf-droid-sans
pkgver=2.1
pkgrel=2
pkgdesc="Beautiful font for the Open Handset Alliance platform, Android."
arch=('any')
url="http://www.droidfonts.com/droidfonts"
license=('Apache')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-droid')
install=readme.install
source=("http://archive.ubuntu.com/ubuntu/pool/universe/t/ttf-droid/ttf-droid_1.00~b112+dfsg+1.orig.tar.gz"
'sans-fontconfig.conf' 'sans-mono-fontconfig.conf')

sha256sums=('a74db6a7177be806c03d6fb411dd8db776ce24bfbe0896c174404242869c98ec'
'93a0dc8e3258be4fafa68df120add114018bb723af7c0d61b60c6d908fcd87b2'
'42da7d1ac6d7055971c8b1bb98a83e893fbed621534b04247a5f6ed89ca14d44')

package() {
	cd "ttf-droid-1.00~b112+dfsg+1"
	
	Fonts=('DroidSans-Bold.ttf' 'DroidSansFallback.ttf' 'DroidSansMono.ttf' 'DroidSans.ttf')
	for i in "${Fonts[@]}"; do
		install -Dm644 $i "$pkgdir"/usr/share/fonts/TTF/$i
	done

	install -Dm644 "$srcdir"/sans-fontconfig.conf $pkgdir/etc/fonts/conf.avail/65-$pkgname-sans-fontconfig.conf
	install -m644 "$srcdir"/sans-mono-fontconfig.conf $pkgdir/etc/fonts/conf.avail/60-$pkgname-sans-mono-fontconfig.conf
}
