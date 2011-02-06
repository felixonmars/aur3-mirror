# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>
# Contributor: kmaster <kmaster12@sasktel.net>

pkgname=klibido
pkgver=0.2.5
pkgrel=10
pkgdesc="KLibido - the KDE3 Linux Binaries Downloader"
arch=('i686' 'x86_64')
url="http://klibido.sourceforge.net/"
license=('GPL') 
depends=('kdelibs3' 'uudeview')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
	'gcc41.patch' 'pausecrash.patch' 'gcc43.patch' 'klibido.diff')

build() {
  . /etc/profile.d/qt3.sh
  . /etc/profile.d/kde3.sh

  cd $srcdir/$pkgname-$pkgver/
  patch -Np1 -i $srcdir/gcc41.patch || return 1
  patch -Np1 -i $srcdir/pausecrash.patch || return 1
  patch -Np0 -i $srcdir/gcc43.patch || return 1
  patch -Np1 -i $srcdir/klibido.diff || return 1
  
  sed -i 's/#include <uudeview\.h>/#include <uudeview\/uudeview\.h>/' ./configure src/queueparts.h
  sed -i 's/LDFLAGS -luu/LDFLAGS -L\/usr\/lib\/uudeview -luu/' ./configure
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
  sed -i 's#all_libraries = -L/usr/lib -L/opt/qt/lib -L/opt/kde/lib#all_libraries = -L/opt/qt/lib -L/opt/kde/lib#' src/Makefile

  make || return 1
  make DESTDIR=$pkgdir install
} 
md5sums=('e343338541a3ff3f2983023ccc922af0'
         'b57258bff0bd61fd581fff3093b49fad'
         '66b16cc2c09d54c060d569976137a775'
         '887117e5fc2e3b1282b327a747ae931b'
		 '6c04457feca9e24505e13a27e9688112')
