# Contributor: Olivier Duclos <olivier.duclos@gmail.com>

pkgname=cnijfilter-mp610
pkgver=2.80
pkgrel=2
pkgdesc="Canon drivers for the MP610 printer/scanner with improved PPD files"
arch=('i686')
url="http://support-asia.canon-asia.com"
license=('custom')
depends=('cups' 'popt' 'ghostscript')
install=mp610.install
source=(http://gdlp01.c-wss.com/gds/0100000841/cnijfilter-common-2.80-1.tar.gz \
	http://downloads.sourceforge.net/mp610linux/ppdMP610en-1.3.tar.gz)
md5sums=('1319f320f9f6651b43e43c0b09af5b73'
         '98de653a2a2f81533ce8eef1f57b9987')

build() {
  cd $srcdir/cnijfilter-common-2.80/libs
  ./autogen.sh --prefix=/usr || return 1

  cd $srcdir/cnijfilter-common-2.80/cngpij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1

  cd $srcdir/cnijfilter-common-2.80/pstocanonij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1

  cd $srcdir/cnijfilter-common-2.80/backend
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1

  cd $srcdir/cnijfilter-common-2.80
  make || return 1

  make install DESTDIR=$pkgdir || return 1

  install -d $pkgdir/usr/lib/bjlib
  install 327/database/*.tbl $pkgdir/usr/lib/bjlib
  install 327/libs_bin/*.so.* $pkgdir/usr/lib
  install -D LICENSE-cnijfilter-2.80E.txt $pkgdir/usr/share/licenses/${pkgname}/license.txt

  cd $srcdir/cnijfilter-common-2.80/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=mp610 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make || return 1
  make install DESTDIR=$pkgdir || return 1

  # Now we install the updated PPDs from http://mp610.blogspot.com
  cd $srcdir
  install -d $pkgdir/usr/share/cups/model
  install canonmp610en.ppd $pkgdir/usr/share/cups/model/
  install cifmp610.conf $pkgdir/usr/lib/bjlib/
}
