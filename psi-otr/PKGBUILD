pkgname=psi-otr
pkgver=0.14
pkgrel=1
pkgdesc="Psi - Jabber client. With patches needed by psi-otrplugin."
license=('GPL')
arch=('i686' 'x86_64')
conflicts=('psi')
provides=('psi')
depends=('qca-ossl' 'qca-gnupg' 'aspell' 'libxss' 'xdg-utils')
url="http://psi-im.org/"
source=("http://public.tfh-berlin.de/~s30935/files/psi-patched-$pkgver.tar.gz")
md5sums=('045b393629c31565d92b2f35900c82ea')

build() {
	cd $startdir/src/psi-patched-${pkgver}
	./configure --prefix=/usr --disable-bundled-qca
	make
}

package() {
	cd $startdir/src/psi-patched-${pkgver}
	make INSTALL_ROOT=$startdir/pkg install
}
