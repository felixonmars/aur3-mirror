pkgname=kdeplasma-extra-serverstatuswidget
pkgbuildname=serverstatuswidget
pkgver=1.5.1
pkgrel=1
pkgdesc="A Plasma application (a.k.a. Plasmoid, Widget, Applet) that lets you monitor the status of remote servers."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Server+Status+Widget?content=101336"
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-serverstatuswidget')
replace=('plasma-serverstatuswidget')
source=("http://kde-look.org/CONTENT/content-files/101336-$pkgbuildname-$pkgver.tar.bz2")
license=('GPL')
md5sums=('2a33c714238edbbd9c4771b973b2d360')

build() {

  cd $srcdir/$pkgbuildname-$pkgver
  mkdir build
  cd build

  cmake ../ -DCMAKE_INSTALL_PREFIX='/usr' ..

  make || return 1
  make DESTDIR=$pkgdir install
}
