# Contributor: Mathijs Kadijk <mkadijk@gmail.com>
pkgname=thumby
pkgver=0.2
pkgrel=1
pkgdesc="A simple thumbnail script in perl."
url="http://mac-cain13.livejournal.com/tag/thumby"
depends=('imagemagick' 'perl')
source=("http://www.mathijs.rnoud.net/stuff/$pkgname-$pkgver.tar.bz2")
md5sums=('9d193801192da6016744237d480c6ce3')

build()
{
  install -D -m755 $startdir/src/$pkgname/$pkgname $startdir/pkg/usr/bin/$pkgname
}

