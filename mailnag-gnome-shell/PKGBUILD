# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>

pkgname=mailnag-gnome-shell
pkgver=3.14.0
pkgrel=1
pkgdesc="Mailnag GNOME-Shell extension"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pulb/mailnag-gnome-shell"
license=('GPL')
depends=('gnome-shell' 'mailnag>=0.9' 'folks')
makedepends=('vala')
source=('https://github.com/pulb/mailnag-gnome-shell/archive/v3.14.0.tar.gz')
md5sums=('2c2418aaf81dcea783e1bcef89a2beb0')
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
