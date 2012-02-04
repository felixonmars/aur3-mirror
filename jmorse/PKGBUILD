# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=jmorse
pkgver=1.2
pkgrel=1
pkgdesc="A java library for generating audible morse code"
arch=('i686' 'x86_64')
url="http://jmorse.sourceforge.net"
license=('GPL3')
depends=('java-runtime' 'p7zip')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.jar jmorse.bin)
noextract=('*.jar')

build() {
	cd $srcdir

	sed -i -e "s:#pkgname:$pkgname:" -e "s:#pkgver:$pkgver:" $pkgname.bin
}

package() {
	cd $srcdir

	install -D -m755 $pkgname.bin $pkgdir/usr/bin/$pkgname
	install -D -m644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname-$pkgver.jar
	ln -sf /usr/share/java/$pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname.jar
}

md5sums=('f16fb86e10fc30e31d0bfb5e8a5288b9'
         '25c17867ecc7c88986eb15971855b958')
sha256sums=('b479e418562b9cf212f7e2de32b1ace5692cdfe71056eb681f05e123a30f0fa2'
            'd5cf383937c54b4698e6e26c4315a1bec4cdac00583c0bb858dd6299f205c7ae')
