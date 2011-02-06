# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=scrollrack
pkgver=1.0
pkgrel=1
pkgdesc="A virtual tabletop on which you can play card games over a network. Designed for M:tG"
arch=(any)
url="http://scrollrack.sourceforge.net"
license=(GPL)
depends=(swt java-smack)
makedepends=(rpmextract)
# I'd rather use rpmextract than try to figure out his retarded build system.
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-1.noarch.rpm
        scrollrack.sh)
md5sums=('deee4dae3c994d9439e6cc6e504635fb'
         '759c182fca62d1b7fc540940f16a44d5')

build() {
  cd $srcdir
  rpmextract.sh $pkgname-$pkgver-1.noarch.rpm

  install -Dm644 usr/share/java/$pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname-$pkgver.jar
  cd $pkgdir/usr/share/java/$pkgname/
  ln -s $pkgname-$pkgver.jar $pkgname.jar

  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
