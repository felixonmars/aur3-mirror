# Mantainer: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: Joel <aullidolunar@at@gmail@dot@com>

pkgname=zoncolor-themes-pack
pkgver=1.6.5
pkgrel=2
pkgdesc="Complete Themes Pack for Linux desktop with Unlimited Color Variants (gtk2/3, unity, openbox & icon themes and wallpapers)"
arch=('any')
url="http://zoncolor.googlecode.com"
license=('GPL3 & CC 3 BY-SA')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gtk-engine-unico: The GTK3 unico engine ')
source=("http://zoncolor.googlecode.com/files/zoncolor-themes-pack_$pkgver.tar.gz")
md5sums=('cf136c8abc88e89410272087e61f237e')

package() {
	# gtk themes
	cd "$srcdir/zoncolor-themes/zoncolor/gtk-themes"
	install -dm755 $pkgdir/usr/share/themes/
	tar xfz "gtk-themes.tar.gz" -C "$pkgdir/usr/share/themes"
	
	# icon themes
	cd "$srcdir/zoncolor-themes/zoncolor/icon-themes"
	install -dm755 $pkgdir/usr/share/icons/
	tar xfz "icon-themes.tar.gz" -C "$pkgdir/usr/share/icons"
	
	# wallpapers
	cd "$srcdir/zoncolor-themes/zoncolor/wallpapers"
	install -dm755 $pkgdir/usr/share/backgrounds/zoncolor
	find . -type f -name "*.png" -exec install -Dm644 '{}' "$pkgdir/usr/share/backgrounds/zoncolor/{}" \;
}

build() {
	cd "$srcdir"
}
