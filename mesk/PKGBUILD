# Contributor: Briquet <mb_briquet@yahoo.es>
pkgname=mesk
pkgver=0.3.2
pkgrel=4
pkgdesc="A Gtk+ audio player."
arch=('i686')
url="http://mesk.nicfit.net/"
license=('GPL')
depends=('python>=2.4' 'pygtk>=2.10' 'gtk2>=2.10' 'librsvg>=2.14' 'gstreamer0.10' 'gstreamer0.10-python')
install=mesk.install
source=(http://mesk.nicfit.net/releases/$pkgname-$pkgver.tgz)
md5sums=('089a99436fd85239a9ce58e6f22205f8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

