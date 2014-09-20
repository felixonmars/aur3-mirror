# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>

pkgname=mailnag-gnome-shell
pkgver=3.12.2
pkgrel=1
pkgdesc="Mailnag GNOME-Shell extension"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pulb/mailnag-gnome-shell"
license=('GPL')
depends=('gnome-shell' 'mailnag>=0.9' 'folks')
makedepends=('vala')
source=('https://github.com/pulb/mailnag-gnome-shell/archive/v3.12.2.tar.gz')
md5sums=('ea8b418f7d939cd38df30f3c66645645')
install='mailnag-gnome-shell.install'

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make prefix="$pkgdir"/usr install
 	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
