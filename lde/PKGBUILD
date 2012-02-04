# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=lde
pkgver=2.6.1
pkgrel=5
pkgdesc="A disk editor for linux"
arch=(i686 x86_64)
license=('GPL')
url="http://lde.sourceforge.net/"
depends=('gpm>=1.20.4')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('7cd3a798cafc07d084db240fd1d1c830')

build() {
  cd $srcdir/$pkgname
  ./configure --prefix=/usr
  sed -e 's/daylight/daylight2/g' -i src/swiped/cnews/getdate.y
  sed -e 's@/sbin@${prefix}/sbin@g' -i Makefile
  make || return 1
  make prefix=$pkgdir/usr mandir=$pkgdir/usr/share/man/man8 \
       INSTALL='install -Dc' install
}


