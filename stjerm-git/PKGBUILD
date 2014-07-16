# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

# Contributor: Diego <cdprincipeat gmaildot com>
# Contributor: Stjepan Glavina <stjepang@gmail.com>
# Contributor: Markus Gross <xsdnyd@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>

pkgname=stjerm-git
pkgver=0.18_2_gdff8657
pkgrel=1
pkgdesc="quake-style terminal emulator"
arch=('i686' 'x86_64')
url="https://github.com/stjerm/stjerm"
license=('GPL')
depends=('vte')
makedepends=('git')
provides=('stjerm')
conflicts=('stjerm' 'stjerm-icebreaker-git')
source=("$pkgname"::'git+https://github.com/stjerm/stjerm.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --always | sed 's#-#_#g;s#v##'
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
