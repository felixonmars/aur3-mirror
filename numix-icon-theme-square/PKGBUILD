# Maintainer: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Antergos Devs <devs@antergos.com>
#
# BUILD INSTRUCTIONS:
# -------------------
# Please visit the following website to purchase the icon set:
#
#	http://satya164.deviantart.com/art/Numix-Square-icons-446392650
#
# and place the resulting 'numix_square_icons.zip' in the same directory
# as this PKGBUILD file and run makepkg to generate the package.

pkgname=numix-icon-theme-square
pkgver=2014.11.10
pkgrel=1
pkgdesc="Square icon expansion theme from the Numix project"
arch=('any')
url='http://numixproject.org/'
license=('custom')
depends=('numix-icon-theme-git')
makedepends=('unzip')
optdepends=('faenza-icon-theme: fallback icons')
options=('!strip')
install="${pkgname}.install"
source=('numix_square_icons.zip' 'fixtheme.patch')
noextract=('numix_square_icons.zip')
sha256sums=(
	'4384bb65701778d6bbdaf1f436321f43804870ecda22baecc2ed9995d8654a8e'
	'ae3762c9767e7c42465016dd4b254858fabf87d6eda587ff91cb7b7150bffbdd')

build()	{
	cd ${srcdir}
	unzip numix_square_icons.zip
	unzip Numix\ Square\ icons.zip
	cd Numix-Square
	patch -i ${srcdir}/fixtheme.patch
}

package() {
	cd ${srcdir}
	pwd
	ln -s 48x48 Numix-Square/scalable
	install -dm 755 "$pkgdir"/usr/share/icons
	cp -dr --no-preserve='ownership' Numix-Square "$pkgdir"/usr/share/icons/

	# License
	install -Dm 644 LICENSE \
	"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
