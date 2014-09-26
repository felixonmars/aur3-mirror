# Maintainer: smldis <dise.utils@gmail.com>

pkgname=('openprogrammer')
pkgver=0.9.0
pkgrel=2
pkgdesc="Gui and Command Line software for Open Programmer a simple Usb Ic programmer, I2C and SPI controller"
arch=('any')
url="http://openprog.altervista.org/"
license=('GPL2')
makedepends=('cmake')
depends=('gtk2')
source=("http://downloads.sourceforge.net/project/openprogrammer/OP/op_$pkgver.tar.gz" 
	"http://downloads.sourceforge.net/project/openprogrammer/OPGUI/opgui_$pkgver.tar.gz"
	'CMakeListsop.txt' 'CMakeListsopgui.txt' '76-openprogrammer.rules')
md5sums=('aefaa1b226719cea0acd99f6e5773431'
	 '9e37baa215d812962d3acea1f9451c37'
         'cc7160c0d00ef069acc17ff9748d3a03'
         '0090a5e011acc917ab35f9831233984a'
	 '99db447961b3105f5ea54933cc8d7261')
build(){
  cd "$srcdir"
  mv CMakeListsop.txt op/CMakeLists.txt
  install -d buildop
  cd buildop
  cmake ../op -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "$srcdir"
  mv CMakeListsopgui.txt opgui/CMakeLists.txt
  install -d buildopgui
  cd buildopgui
  cmake ../opgui -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  install -d ${pkgdir}/lib/udev/rules.d/
  cp $srcdir/76-openprogrammer.rules ${pkgdir}/lib/udev/rules.d/76-openprogrammer.rules

  cd "$srcdir/buildop"
  make DESTDIR="${pkgdir}" install

  cd "$srcdir/buildopgui"
  make DESTDIR="${pkgdir}" install
}