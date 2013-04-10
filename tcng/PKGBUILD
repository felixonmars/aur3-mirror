# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Tino Reichardt <milky-archlinux@mcmilk.de>
pkgname=tcng
pkgver=10b
pkgrel=5
pkgdesc="TC Next Generation"
url="http://tcng.sourceforge.net/"
license=("GPL")
depends=('glibc' 'iproute2')
arch=(x86_64 i686)
conflicts=(tcc)
source=(http://tcng.sourceforge.net/dist/$pkgname-$pkgver.tar.gz tcng_10b-3.diff)

prepare() {
	patch -d $pkgname -Np1 -i $srcdir/tcng_10b-3.diff
	grep -rlZ '/lib/cpp' |xargs -0 sed -i 's:/lib/cpp:/usr/bin/cpp:g'
}
build() {
  cd $pkgname
  rm -f config
  ./configure --no-tcsim --c99 -d /usr  -D /usr/lib/tcng
  make
}
package() {
  cd $pkgname
  install -d $pkgdir/usr
  make TCNG_INSTALL_CWD=/usr DESTDIR=$pkgdir install
  mv $pkgdir/usr/bin/tcc{.bin,}
}
md5sums=('d28bc6b1ed8973814213942288ab5d18'
         '5e40849c0dfb8ec6e7b89213c400fe34')
