pkgname=linphone-plugin-msamr
_pkgname=msamr
pkgver=1.0.1
pkgrel=1
pkgdesc="Linphone plugin that enables AMR audio codec"
url="http://www.linphone.org/"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://download-mirror.savannah.gnu.org/releases/linphone/plugins/sources/$_pkgname-$pkgver.tar.gz)
depends=('linphone' 'opencore-amr')
options=('!makeflags')
sha256sums=('055b76f531780a8fac4bdc65d644f6c0419f24ee5f96acc028da3189b81b1b0a')
 
build() {
 
cd "$srcdir/$_pkgname-$pkgver"
 
autoreconf --force --install
./configure --prefix=/usr
 
make
}
 
package() {
 
cd "$srcdir/$_pkgname-$pkgver"
 
make PACKAGE_PLUGINS_DIR=\$\(libdir\)/liblinphone/plugins DESTDIR="$pkgdir" install
}
