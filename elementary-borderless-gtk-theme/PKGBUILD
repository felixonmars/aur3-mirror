# Contributor: Bartosz Chmura <chmurli at gmail dot com>

pkgname=elementary-borderless-gtk-theme
pkgver=0.2.5
pkgrel=1
pkgdesc="modified Elementary theme which looks very slick thanks to the removal of the borders and smaller widgets"
arch=('any')
url=('http://bobdmv.deviantart.com/art/Elementary-borderless-v0-2-5-192767462')
license=('custom')
depends=('gtk-engine-murrine-git' 'gtk-aurora-engine' 'gtk-engine-equinox')
optdepends=('faenza-cupertino-icons: recolored Folder Icons for Faenza Icontheme [AUR]'
	'elementary-icons: the elementary icon theme [AUR]'
	'nautilus-elementary: the fork of Nautilus for simplicity [AUR]')
source=('http://dl.dropbox.com/u/993023/elementary-borderless_v025.tar.gz')
md5sums=('1047a6bbecc6cf1b5f05e2a7e2ec0deb')

build () {
	mkdir -p ${pkgdir}/usr/share/themes
	chmod -R 755 $srcdir/elementary-borderless
	cp -R $srcdir/elementary-borderless ${pkgdir}/usr/share/themes || return 1	
}
