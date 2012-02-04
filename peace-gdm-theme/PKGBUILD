# Contributor: simo91 <simo91.linux@gmail.com>

pkgname=peace-gdm-theme
pkgver=0.2
pkgrel=1
dist=intrepid
pkgdesc="Peace look - GDM theme"
arch=(i686 x86_64)
url="http://packages.ubuntu.com/${dist}/peace-gdm-theme"
license=('GPL')
depends=('gdm')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/p/peace-look/peace-look_${pkgver}.orig.tar.gz)
md5sums=('4d6a218a8e7df499e1b4c26e0f5f7108')

build() {
	cd "$srcdir"/peace-look-0.2/gdm
	install -d "$pkgdir"/usr/share/gdm/themes/peace
	mv * "$pkgdir"/usr/share/gdm/themes/peace
}
