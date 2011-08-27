# Contributor: Filippo 'JoeyrS' Civiletti <joeyrs@gmail.com>

pkgname=kwin-decor-suse2
pkgver=0.4.1
pkgrel=1
pkgdesc="KDE Kwin Decoration from OpenSuSE 10.2"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=23579"
license=('GPL')
depends=('kdebase')
makedepends=('pkgconfig')
source=(http://www.gerdfleischer.de/kwin-decor-suse2/$pkgname-$pkgver.tar.bz2 arch_decor.png)
md5sums=('265949cef3b9f00de4e1fc4d7c5697b5' 'abab7fb5f13587f78b51ddb4e3e3f62b')

build() {
   cd $startdir/src/$pkgname-$pkgver
   install -m644 ../arch_decor.png .
   ./configure --disable-debug --prefix=/opt/kde
   make || return 1
   make DESTDIR=$startdir/pkg install
}
