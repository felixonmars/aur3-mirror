# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_gtk2_themes-gray
pkgver=0.1
pkgrel=4
pkgdesc="GTK2 themes for OpenArch"
arch=('any')
groups=('openarch_gray')
url="http://gnome-look.org/"
license=('GPL')
depends=('gtk-engine-murrine-git')
source=('elegant-gtk.tar.gz' 'shiki-statler-dark.tar.gz'
		'slickness-black.tar.gz' 'statlerbox.tar.gz')

md5sums=('5cd8f4b34219fe9f893ec9592b4a5d30'
         '045b604421b1cb7a79f2c9268d1ae03a'
         '0f04f330f18feb07717dd9edc29957a5'
         '27eef82e9de221c0d51a929e03c8c2b5')

build() {
	cd "${srsdir}"
	for a in *.tar.gz; do
	  tar -xf "${a}" -C "${pkgdir}"/
	done
}
