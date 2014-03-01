# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=sat_media
pkgver=0.4.0
pkgrel=1
pkgdesc="Media files for Salut à Toi"
url="http://salut-a-toi.org/"
arch=('any')
depends=('sat-xmpp')
license=('AGPL3')
source=("ftp://ftp.goffi.org/$pkgname/$pkgname-${pkgver}.tar.bz2")
md5sums=('ddb4139e7b8cfd7b9378d1884d58df70')
options=('!strip')

package(){
  mkdir -p "$pkgdir/usr/share/sat/"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/sat/media/"
}
