# Contributor kevku <kevku@msn.com>
pkgname=bin32-gmlive-extra
_pkgname=gmlive-extra
pkgver=0.3
pkgrel=5
pkgdesc="Addons for gmlive, provides pplive & ppstream support."
arch=('x86_64')
url="http://code.google.com/p/gmlive/"
license=('unknown')
depends=('lib32-libxext' 'libpps')
makedepends=('gcc-multilib')
install=bin32-gmlive-extra.install
source=("http://gmlive.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
md5sums=('e94313ff9170e7375b75b518a7aae5cf')

build() {
cd "$srcdir/$_pkgname-$pkgver/ppstream"
tar xf "../lib-826.tar.gz"
sed -i 's|gcc -shared -Wl|gcc -m32 -shared -fPIC -Wl|g' Makefile
make
}

package(){
cd "$_pkgname-$pkgver/ppstream"
install -d ${pkgdir}/usr/bin
install -Dm755 xpps ${pkgdir}/usr/bin/
install -Dm755 ../xpplive ${pkgdir}/usr/bin/
#install -Dm755 ../sp-sc-auth ${pkgdir}/usr/bin/
install -d ${pkgdir}/usr/lib32/
#cp -ar lib/* ${pkgdir}/usr/lib32/
cp -ar libppswrapper-preload.* ${pkgdir}/usr/lib32/
}