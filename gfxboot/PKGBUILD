# Contributor: fancris3 <fancris3 at gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: flu

pkgname=gfxboot
pkgver=4.5.1
_pkgver=4.1.3
pkgrel=1
arch=('i686' 'x86_64')
license=(GPL)
install=gfxboot.install
pkgdesc="Graphical Boot Logo tool"
url="http://www.opensuse.org"
depends=('perl-html-parser' 'freetype2' 'cpio' 'nasm')
makedepends=('rpmextract')
source=(http://download.opensuse.org/source/distribution/13.1/repo/oss/suse/src/${pkgname}-${pkgver}-${_pkgver}.src.rpm
	gfxboot.html)
options=(docs)

md5sums=('79581c4c225c1c72f616032d39cf0c37'
         'f824c5bc2f716f8029677cae6956c1c7')

build() {

  rpmextract.sh ${pkgname}-${pkgver}-${_pkgver}.src.rpm 2>/dev/null

  for i in $(find -name '*.tar.bz2'); do tar -jxf $i; done
  mv -f themes ${pkgname}-${pkgver}/

  cd ${pkgname}-${pkgver}

  sed  -i 's!^#include <freetype/ftsynth.h>!#include <freetype2/ftsynth.h>!' gfxboot-font.c
  make -s 2>/dev/null

  make -s DESTDIR=${srcdir} installsrc

}

package() {

  install -d -m 755 ${pkgdir}/usr/{bin,share/man/man8,share/{,doc}/gfxboot}
  install    -m 755 ${srcdir}/${pkgname}-${pkgver}/gfxboot{,-compile,-font} \
    ${pkgdir}/usr/bin
  install    -m 644 ${srcdir}/${pkgname}-${pkgver}/doc/gfxboot.8            \
    ${pkgdir}/usr/share/man/man8
  install    -m 644    ../gfxboot.html                                      \
    ${pkgdir}/usr/share/doc/gfxboot
  cp         -r     ${srcdir}/${pkgname}-${pkgver}/{bin,test,themes}        \
    ${pkgdir}/usr/share/${pkgname}
}

# alternative source download
#source=(http://archpkg.rodp.net/src/${pkgname}-${pkgver}-${pkgrel}.src.rpm)
# vim:set ts=2 sw=2 et:
