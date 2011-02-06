# Contributor : mutlu_inek <mutlu_inek@yahoo.de>

pkgname=kerry
pkgver=0.2.2
pkgrel=1
pkgdesc="A KDE gui for the Beagle desktop search tool."
url="http://en.opensuse.org/Kerry"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdebase' 'beagle' 'libbeagle')
makedepends=('pkgconfig')
conflicts=()
provides=()
source=(http://ftp.de.debian.org/debian/pool/main/k/kerry/kerry_$pkgver.orig.tar.gz 
	beagle_0.3_support.patch 
	svn.patch)
md5sums=('373b1e1da97074b21bda123a514a69fb' '8d78c5a5f53765e29214cb74333accaa'
	'fd05aef7634efbc341b4fa2c9bc1f62e')

build() {
  source /etc/profile.d/qt3.sh

  cd $startdir/src/kerry-$pkgver.orig
  patch -p0 -i $startdir/src/beagle_0.3_support.patch || return 1

  cd $startdir/src/kerry-$pkgver.orig/kerry
  patch -p0 -i $startdir/src/svn.patch || return 1
 	
  cd $startdir/src/kerry-$pkgver.orig
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
  make || return 1
  make DESTDIR=$startdir/pkg install
} 
