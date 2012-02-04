# Contributor: Catalin Stoian <unixlust[at]unixlust.ath.cx>
pkgname=lastbash
pkgver=0.3.2
pkgrel=1
license=('GPL')
pkgdesc="LastBASH is a console/terminal based Last.fm player"
arch=(i686 x86_64)
url="http://lastbash.sourceforge.net/"
depends=('bash')
source=(http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8846371db96932c0b53de8a04f9d5997')
build() {
  cd $startdir/src/$pkgname-$pkgver
  make PREFIX=$startdir/pkg/usr/bin DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/usr/bin
  mv $startdir/pkg/usr/local/bin/lastbash $startdir/pkg/usr/bin/lastbash
  rm -rf $startdir/pkg/usr/local
}
