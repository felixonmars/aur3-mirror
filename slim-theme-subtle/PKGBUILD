# Contributor: lchr (lchr@spellcraft.dk)

pkgname=slim-theme-subtle
pkgver=1.0
pkgrel=1
pkgdesc="A Subtle theme for SLiM"
install=slim-theme-subtle.install
license=('GPL2')
arch=('i686' 'x86_64')
url="http://subforge.org/"
depends=('slim')
source=(http://spellcraft.dk/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('d748e93043edfbfe8517697742025902')

build() {
	cd ${srcdir}/slim-theme-subtle-1.0
	
	install -m 644 -D background.png ${pkgdir}/usr/share/slim/themes/subtle-theme/background.png
	install -m 644 -D panel.png ${pkgdir}/usr/share/slim/themes/subtle-theme/panel.png
	install -m 644 -D slim.theme ${pkgdir}/usr/share/slim/themes/subtle-theme/slim.theme

	install -m 755 -d $startdir/pkg/usr/share/licenses/$pkgname
	install -m 644 -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/
}
