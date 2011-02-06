# Contributor: Stephan Hillebrand <stefh123 at yahoo dot de>

pkgname=klaus
pkgver=0.1
pkgrel=1
pkgdesc="A platform independent chess program"
arch=('i686' 'x86_64')
url="http://launchpad.net/klaus"
license=('GPL')
groups=("games")
depends=('bash' 'java-runtime>=6u1')
source=(http://launchpad.net/klaus/trunk/0.1/+download/$pkgname-$pkgver-bin.tar.gz 
klaus.sh klaus.desktop)

md5sums=('cb44f509ee5fa5ebe992af7c1cd45388'
         '0205506613a36c1fc8ad3e87f3f9bd44'
         '92f79542ff99b6cafa82b5e1d2341f16')
build() {
cd $srcdir
#  make || return 1
}
package() {
  cd $srcdir
  install -d ${pkgdir}/usr/share/klaus
  cp -r bin lib share ${pkgdir}/usr/share/klaus
  install -Dm755 $srcdir/klaus.sh ${pkgdir}/usr/bin/klaus
  install -Dm644 klaus.desktop $pkgdir/usr/share/applications/klaus.desktop
  install -D $srcdir/share/klaus/graphics/klauschess.svg $pkgdir/usr/share/pixmaps/klauschess.svg
}
