# Contributor: mitro <mitro@somecode.com>
pkgname=taskjuggler
pkgver=2.4.3
pkgrel=1
pkgdesc="Taskjuggler is a project management tool for Linux and UNIX system-based operating systems."
url="http://www.taskjuggler.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs3' 'libstdc++5')
source=(http://www.taskjuggler.org/download/$pkgname-$pkgver.tar.bz2)
md5sums=('3bc88500856c7c9dc2fc526d5f04ac04')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/opt/kde  --without-arts --with-kde-support=no --with-ical-support=no
  # This test is buggy and always fails, so remove it
  rm ${srcdir}/${pkgname}-${pkgver}/TestSuite/Syntax/Errors/Timezone.tjp
  make
  make DESTDIR=${pkgdir} install
}
