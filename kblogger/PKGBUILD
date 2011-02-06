# Contributor: Björn Brandenburg <askadar@cs.tu-berlin.de>
pkgname=kblogger
pkgver=0.6.2
pkgrel=1
pkgdesc="KBlogger is a simple to use blogging application for the K Destkop Environment. It integrates in KDE Kicker for easy and fast blogging."
url="http://kblogger.pwsp.net/"
license="GPL"
depends=('kdebase')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://kblogger.pwsp.net/files/$pkgname-$pkgver.tar.gz autotools-version.patch)
md5sums=(80dde42d5d296aae2a6d1dcfea6447a9 a3f5d6d2ab44e8004d3efbdeb3b806ce)

build() {
  # for some reason this relese has an archlinux allergy
  # so a little work around is needed
  
  # first patch up the autotools stuff
  cd $startdir/src/$pkgname-$pkgver/admin
  # this patch is ripped right out of the kompose package
  # maintained by shastry <vinayshastry@gmail.com>
  # thank you!
  patch -p2 < ../../autotools-version.patch || return 1
  # let's get a working configure script
  cd $startdir/src/$pkgname-$pkgver
  make -f Makefile.cvs || return 1
  # now we can build the package
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
