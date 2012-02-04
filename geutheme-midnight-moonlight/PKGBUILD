#
# Contributor: thoughtcrime
#
# $pkgver is the "last modified" date from:
# http://themes.opengeu.intilinux.com/themes/
#

pkgname=geutheme-midnight-moonlight
pkgver=20100106
pkgrel=1
pkgdesc="Default OpenGEU Moonlight theme for Quarto di Luna"
arch=(x86_64 i686)
url="http://themes.opengeu.intilinux.com/opengeu_midnight_moonlight/"
license=('GPL')
optdepends=('e17-settings-daemon: allows to set the GTK2-settings on the fly')
install=geutheme.install
source=(http://themes.opengeu.intilinux.com/themes/OpenGEU_Midnight_Moonlight.gth.tar.gz)
md5sums=('6cfb7ba04d693b126c4da5c2b4fa722e')

build() {
	# remove the "index.html" junk from the theme
	cd "$srcdir/GTK"
	find . -name index.html* -print0 | xargs -0 rm
	
	# move everything to the $pkgdir
	install -d "$pkgdir/usr/share/enlightenment/data"
	mv "$srcdir/GTK" "$pkgdir/usr/share/themes"
	mv "$srcdir/Icons" "$pkgdir/usr/share/icons"
	mv "$srcdir/E17" "$pkgdir/usr/share/enlightenment/data/themes"
	mv "$srcdir/Control" "$pkgdir/usr/share/opengeu-themes"
	
	# make the gth file executable
	cd "$pkgdir/usr/share/opengeu-themes/"
	chmod +x *.gth
}

# vim:set ts=2 sw=2 et:
