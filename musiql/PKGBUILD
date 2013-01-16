# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: rabyte <rabyte__gmail>

pkgname=musiql
pkgver=0.0.20080602
pkgrel=2
pkgdesc="An MPlayer wrapper providing SQLite music library management"
arch=('i686' 'x86_64')
url="http://musiql.sourceforge.net/"
license=('GPL')
depends=('python2-pysqlite' 'mplayer' 'mutagen>=1.13')
makedepends=('python2-distribute')
optdepends=('lastfmsubmitd: Last.FM submission support')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('184a83494adae8202f439721db45035d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
