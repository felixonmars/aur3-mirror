# Contributor: sam.saffron@gmail.com based off toliman <altergan@hs-albsig.de>
pkgname=cnijfilter-mp210
pkgver=2.80
pkgrel=1
pkgdesc="Canon PIXMA MP210 printing driver for CUPS"
arch=('i686')
url="http://support-au.canon.com.au/contents/AU/EN/0100084103.html"
license=('GPL2' 'custom:BSD' 'custom:CANON')
depends=('cups>=1.1.14' 'ghostscript>=5.50' 'popt>=1.4')
makedepends=('autoconf>=2.13' 'automake>=1.4' 'tar' 'make' 'gcc')
source=('http://gdlp01.c-wss.com/gds/0100000841/cnijfilter-common-2.80-1.tar.gz')
md5sums=('1319f320f9f6651b43e43c0b09af5b73')

build() {


  tar zxf cnijfilter-common-2.80-1.tar.gz

  cd $srcdir/cnijfilter-common-2.80/libs
  ./autogen.sh --prefix=/usr || return 1
  cd $srcdir/cnijfilter-common-2.80/cngpij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1
  cd $srcdir/cnijfilter-common-2.80/pstocanonij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1
  cd $srcdir/cnijfilter-common-2.80/backend
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1
  cd $srcdir/cnijfilter-common-2.80/ppd
  ./autogen.sh --prefix=/usr || return 1
  cd $srcdir/cnijfilter-common-2.80

  make || return 1

  make install DESTDIR=$startdir/pkg || return 1
  install -d $startdir/pkg/usr/lib/bjlib
  install -c -m 755 316/database/* $startdir/pkg/usr/lib/bjlib
  install -c -s -m 755 316/libs_bin/*.so.* $startdir/pkg/usr/lib
  install -D libs/buftool/LICENSE.txt $startdir/pkg/usr/share/licenses/${pkgname}/BSD
  install -D LICENSE-cnijfilter-2.80E.txt $startdir/pkg/usr/share/licenses/${pkgname}/CANON
  rm $startdir/pkg/usr/share/cups/model/canonip*
  rm $startdir/pkg/usr/share/cups/model/canonmp210.ppd

  cd $srcdir/cnijfilter-common-2.80/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=mp210 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
}

