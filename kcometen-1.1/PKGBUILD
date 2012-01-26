# Contributor: Philipp Giebel <arch@ambience-design.net
pkgname=kcometen3
pkgver=1.1
pkgrel=2
pkgdesc="an OpenGL screensaver for KDE."
depends=('kdelibs' 'mesa')
source=("http://user.cs.tu-berlin.de/~pmueller/files/$pkgname-$pkgver.tar.gz")
url="http://www.kde-look.org/content/show.php?content=30313"
license="GPL"
md5sums=('36f846b6a3e5f71c4532070b1f17b717')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
