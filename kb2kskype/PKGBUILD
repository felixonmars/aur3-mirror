# Maintainer: Darin <omgwtfbyobbq at gmail d0t com>
pkgname=kb2kskype
pkgver=0.3.8
pkgrel=1
pkgdesc="An application to make your USB-B2K telbox work with skype on linux"
url="http://kb2kskype.sourceforge.net/"
arch=('i686')
license=('GPL')
depends=(kdelibs3 usbb2k-api)
source=('http://downloads.sourceforge.net/project/kb2kskype/kb2kskype/kb2kskype-0.3.8/kb2kskype-0.3.8.tar.bz2?use_mirror=superb-sea2&ts=1279700670')
md5sums=('b05f780cc83317d4452981acac9e6e8e')

build() {
  cd $srcdir/$pkgname-$pkgver
  . /etc/profile.d/qt3.sh
  . /etc/profile.d/kde.sh
  ./configure	--with-qt-dir=/opt/qt \
	--without-arts \
	--bindir=/usr/bin \
	--mandir=/usr/share/man/man1 \

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  mkdir -p $pkgdir/usr/bin
  mv $pkgdir/opt/kde/bin/kb2kskype $pkgdir/usr/bin
  rm -r $pkgdir/opt/
  chrpath -d $pkgdir/usr/bin/kb2kskype
}
