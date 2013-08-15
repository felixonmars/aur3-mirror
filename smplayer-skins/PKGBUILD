pkgname=smplayer-skins
pkgver=20130605
pkgrel=1
pkgdesc="Skins for SMPlayer"
arch=('any')
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('smplayer')
source=(http://downloads.sourceforge.net/smplayer/$pkgname-$pkgver.tar.bz2)
sha1sums=('7ab2f12873c9ac863af5461672ffa96aa00da6bc')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=$pkgdir/usr install
}
