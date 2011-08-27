# Contributor: Diestelhenne <diestelhenne@googlemail.com>

pkgname=kdedecor-opak
pkgver=0.1
pkgrel=2
pkgdesc="This time no port of a Beryl theme, but almost a complete new WinDeco for KDEs KWin. However, SkyOS' artwork http://skyos.org provided me with some inspirations."
url="http://www.kde-look.org/content/show.php?content=67012"
license="GPL"
arch=('x86_64' 'i686')
depends=('kdebase')
source=(http://works13.com/downloads/Opak-$pkgver.tar.gz)
md5sums=('91f54218b49bdf862b2d2d44db017840')

build() {
  cd $startdir/src/Opak-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
