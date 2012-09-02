# Contributor: Robert Mihaly <robb.mihaly@gmail.com>
# PKGBUILD based on: Gary Ayre <catchfire@gmail.com>
## PKGBUILD based on: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-mx410
pkgver=3.50
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Pixma MX410 multifunction"
arch=('x86_64')
url="http://software.canon-europe.com/software/0040869.asp"
license=('GPL2' 'LGPL2' 'custom')
depends=('libglade' 'cups' 'ghostscript')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common')
install=cnijfilter-mx410.install
source=("http://files.canon-europe.com/files/soft40869/software/cnijfilter-source-${pkgver}-${pkgrel}.tar.gz" "cups.patch" "id.po.patch" "png.patch")
md5sums=('a900a47246c3d17d1ed5ed801ee29787' 'f0b3e72bbf0b0426aa31f52eac755f49' '8440dbf3edd142e746d0b3043d6307b2' 'da5fcef8eef444ea1d049bc75323611a')

build() {
  cd ${srcdir}
  tar xzf cnijfilter-source-${pkgver}-${pkgrel}.tar.gz

  patch -Np0 -i $startdir/src/cups.patch || return 1
  patch -Np0 -i $startdir/src/id.po.patch || return 1
  patch -Np0 -i $startdir/src/png.patch || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/backend
  ./autogen.sh --prefix=/usr --program-suffix=mx410 --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/libs
  ./autogen.sh --prefix=/usr --program-suffix=mx410 || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/pstocanonij
  ./autogen.sh --prefix=/usr --program-suffix=mx410 --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/cngpij
  ./autogen.sh --prefix=/usr --program-suffix=mx410 --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/ppd
  ./autogen.sh --prefix=/usr --program-suffix=mx410 || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=mx410 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/printui
  ./autogen.sh --prefix=/usr --program-suffix=mx410 --datadir=/usr/share --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=mx410 --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=mx410 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}-${pkgrel}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 381/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 381/libs_bin64/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  ln -s /usr/lib/cups/filter/pstocanonijmx410 ${pkgdir}/usr/lib/cups/filter/pstocanonij
  chown -R root:root ${pkgdir}/usr/

}
