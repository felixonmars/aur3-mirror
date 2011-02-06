# Contributor: Zoran Olujic <olujicz@gmail.com>
pkgname=nkrecnik-gtk
pkgver=0.7
pkgrel=2
pkgdesc="NK Recnik is English-Serbian and Serbian-English dictionary. It features over 70,000 words and phrases"
url="http://nkrecnik.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=()
makedepends=()
source=(http://prdownloads.sourceforge.net/nkrecnik/nkrecnik-$pkgver.tar.bz2)
md5sums=('34d6cab2466f9fb2fa6ae4e248a28550')

build() {
  cd $startdir/src/NKRecnik
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
