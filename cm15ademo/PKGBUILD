# Maintainer: Bruno Adele <bruno.adele#jesuislibre.org>
pkgname=cm15ademo
pkgver=2009.1
pkgrel=1
pkgdesc="A demo utilization for a cm15a module"
arch=('i686' 'x86_64')
url="http://www.eclipsehomeauto.com/"
license=('GPL')
groups=()
depends=('linux' 'iplc')
makedepends=('gcc') #base-devel
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.eclipsehomeauto.com/cm15a_on_linux/cm15ademo.tar.gz)
noextract=()
sha256sums=('46c1c34e77f1cca412dd84d716258bb4c34c7c28009924803d02c09d7d82f1d3')

build() {
	cd "$srcdir"

	make
}

package() {
	cd "$srcdir"
	
	install -D cm15ademo $pkgdir/usr/bin/cm15ademo
}
