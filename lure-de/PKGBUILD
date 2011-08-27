# Contributor: rabyte <rabyte__gmail>

pkgname=lure-de
pkgver=1.1
pkgrel=2
pkgdesc="Lure of the Temptress is a fantasy point-and-click adventure game with comedic elements"
arch=('i686' 'x86_64')
url="http://www.revolution.co.uk/_display.php?id=10"
license=('custom')
depends=('scummvm>=0.11')
makedepends=('unzip')
source=(http://downloads.sourceforge.net/scummvm/$pkgname-$pkgver.zip \
	https://scummvm.svn.sourceforge.net/svnroot/scummvm/scummvm/tags/release-0-11-1/dists/engine-data/lure.dat \
	$pkgname.sh)
md5sums=('202554fb0568eb01f740bfe82d8e725f'
         'd92372e7eead8d6e64f40cce381ec6ea'
         'b308d0ff05bde8b10a64ea2d45503e9c')

build() {
  cd $startdir/src/$pkgname

  mkdir -p $startdir/pkg/usr/share/$pkgname
  install -m644 *.vga Manual.pdf ../lure.dat $startdir/pkg/usr/share/$pkgname/
  install -m644 -D LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt

  install -m755 -D ../$pkgname.sh $startdir/pkg/usr/bin/$pkgname
}
