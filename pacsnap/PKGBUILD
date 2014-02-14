# original author & maintainer: M.Carreira <manuel@carreira.com.pt>
# current maintainer: T.Engert
pkgname=pacsnap
pkgver=0.10.5
pkgrel=1
pkgdesc="An emergency package rollback utility and package snapshots (pacshots) manager"
arch=('any')
url="http://linux.carreira.com.pt/pacsnap"
license=('GPL')
depends=('bash' 'coreutils' 'pacman' 'curl' )
changelog=ChangeLog
#source=(http://linux.carreira.com.pt/$pkgname/$pkgver-$pkgrel/$pkgname-$pkgver.tar.gz)
source=($pkgname-$pkgver.tar.gz)
md5sums=('05e8f3a6bd027e92e1d85785946b9758')

build() {
  cd "$srcdir"

  install -d $pkgdir/usr/bin
  install -p -o 0 -g 0 -m 755 pacsnap $pkgdir/usr/bin
  install -d $pkgdir/etc/pacman.d
  install -p -o 0 -g 0 -m 644 pacsnap.conf $pkgdir/etc
  install -p -o 0 -g 0 -m 644 pacsnap.listconf $pkgdir/etc/pacman.d
  install -p -o 0 -g 0 -m 644 pacsnap.media $pkgdir/etc/pacman.d
  install -p -o 0 -g 0 -m 644 pacsnap.mirrorlist $pkgdir/etc/pacman.d
  install -d $pkgdir/usr/share/doc/$pkgname-$pkgver
  install -p -o 0 -g 0 -m 644 README $pkgdir/usr/share/doc/$pkgname-$pkgver
  install -p -o 0 -g 0 -m 644 TODO $pkgdir/usr/share/doc/$pkgname-$pkgver
  install -d $pkgdir/usr/share/man/man8
  install -p -o 0 -g 0 -m 644 pacsnap.8.gz $pkgdir/usr/share/man/man8
 
}

# vim:set ts=2 sw=2 et:



