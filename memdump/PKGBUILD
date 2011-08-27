# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=memdump
pkgver=1.01
pkgrel=1
pkgdesc="Dumps system memory to stdout, skipping over holes in memory maps."
arch=('i686' 'x86_64')
url="http://www.porcupine.org/forensics/tct.html"
license=('custom:IPL')
depends=(glibc)
source=(http://www.porcupine.org/forensics/$pkgname-$pkgver.tar.gz)
md5sums=('41076a611098af79f3b893f515ae22da')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -Dm0755 memdump $pkgdir/usr/bin/memdump
  install -Dm0644 memdump.1 $pkgdir/usr/share/man/man1/memdump.1
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
