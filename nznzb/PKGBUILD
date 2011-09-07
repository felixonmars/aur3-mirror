# Maintainer: Iwan Timmer <irtimmer at gmail dot com>

pkgname=nznzb
pkgver=0.97
pkgrel=1
pkgdesc="NZB download utility"
url="http://www.lemoncube.com/458.html"
source=(http://www.lemoncube.com/download/$pkgname-$pkgver.tar.gz)
sha256sums=('320896f28962fcbfa4290d8608be1c6d1f3a2b585aa30fff8d977d62ec492a91')
arch=(i686 x86_64)
license=(unknown)
depends=(openssl)
optdepends=('unrar: extract rar files as they download'
'par2cmdline: par2 support')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./make.sh $pkgname
}

package()
{
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  cp $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin
  cp $srcdir/$pkgname-$pkgver/README.txt $pkgdir/usr/share/doc/$pkgname
  cp $srcdir/$pkgname-$pkgver/sample.nznzbrc $pkgdir/usr/share/doc/$pkgname
}
