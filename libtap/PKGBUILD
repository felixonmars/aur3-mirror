# Maintainer : T. Jameson Little <t.jameson.little@gmail.com>
# Contributer : T. Jameson Little <t.jameson.little@gmail.com>
pkgname=libtap
pkgver=0.1.0
pkgrel=1
pkgdesc="Feature-full TAP producer library in C"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/zorgnax/libtap"
license=("GPL")
depends=()
optdepends=()
makedepends=()
provides=('libtap')
conflicts=()
install=
source=("https://github.com/zorgnax/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3ead97aecd4553e7724e75ca109a47698a3de2ff859eb7d197178cde6d4f252c41714e463dc3a83a11f490b3b42648a8b19fa46046cebc812904195461ff0d6b')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}

