# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Josip <josipponjavic at gmail dot com>

pkgname=ubuntu-community-themes
pkgver=0.22.1
pkgrel=1
pkgdesc="This package showcases desktop themes and window decorations created by the Ubuntu artwork community."
arch=("any")
url="http://packages.ubuntu.com/lucid/community-themes"
license=("CCPL")
depends=('gtk-engine-murrine')
optdepends=('humanity-icon-theme')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/c/community-themes/community-themes_${pkgver}.tar.gz)
md5sums=('baa42aff4bd461b3202a22efc2dcaa1a')

package() {
	cd "${srcdir}/community-themes-${pkgver}"
        mkdir -p $pkgdir/usr/share/themes
        cp -r ./Hanso $pkgdir/usr/share/themes
        mv $pkgdir/usr/share/themes/Hanso/index.theme.in $pkgdir/usr/share/themes/Hanso/index.theme
        cp -r ./Homosapien $pkgdir/usr/share/themes
        mv $pkgdir/usr/share/themes/Homosapien/index.theme.in $pkgdir/usr/share/themes/Homosapien/index.theme
        cp -r ./Impression $pkgdir/usr/share/themes
        mv $pkgdir/usr/share/themes/Impression/index.theme.in $pkgdir/usr/share/themes/Impression/index.theme
        cp -r ./Kin $pkgdir/usr/share/themes
        mv $pkgdir/usr/share/themes/Kin/index.theme.in $pkgdir/usr/share/themes/Kin/index.theme
        cp -r ./Night-Impression $pkgdir/usr/share/themes
        mv $pkgdir/usr/share/themes/Night-Impression/index.theme.in $pkgdir/usr/share/themes/Night-Impression/index.theme
        cp -r ./Sorbet $pkgdir/usr/share/themes
        mv $pkgdir/usr/share/themes/Sorbet/index.theme.in $pkgdir/usr/share/themes/Sorbet/index.theme
        cp -r ./Turrican $pkgdir/usr/share/themes
        mv $pkgdir/usr/share/themes/Turrican/index.theme.in $pkgdir/usr/share/themes/Turrican/index.theme
        cp -r ./Wasp-Murrine $pkgdir/usr/share/themes
        mv $pkgdir/usr/share/themes/Wasp-Murrine/index.theme.in $pkgdir/usr/share/themes/Wasp-Murrine/index.theme
}

