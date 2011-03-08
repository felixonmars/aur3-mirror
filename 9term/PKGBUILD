# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=('9term' 'sam')
pkgbase=9term
pkgver=1.6.6
_debver=5
pkgrel=1
arch=('i686' 'x86_64' 'arm')
pkgdesc="pre-plan9port tools 9term and sam (Xg/Xt based)"
url="http://sydney.edu.au/engineering/it/~matty/9term/"
license=('custom')
depends=('libxt')
source=(
http://archive.debian.org/debian/dists/slink/main/source/x11/${pkgbase}_${pkgver}-${_debver}.diff.gz
http://archive.debian.org/debian/dists/slink/main/source/x11/${pkgbase}_${pkgver}.orig.tar.gz
${pkgbase}-${pkgver}-${_debver}-modern.patch
sam.Make.linux
samterm.Make.linux
)
md5sums=('62e4c425b92bf8b2623a3206e3e093a4'
         '163d950994d83815f85781bcd2e6d635'
         '725029b119b75a18eeaf93406743e7d6'
         '9bc1f3614e22ac10cb847215a407478c'
         '582077f83c367907a87f31f4fecefada')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}.orig
  zcat ${srcdir}/${pkgname}_${pkgver}-${_debver}.diff.gz | patch -p1
  patch -p1 < ${srcdir}/9term-${pkgver}-${_debver}-modern.patch
  cp ${srcdir}/sam.Make.linux sam/Make.linux
  cp ${srcdir}/samterm.Make.linux samterm/Make.linux

  ( cd libframe && make -f Make.linux )
  ( cd libtext && make -f Make.linux )
  ( cd libXg && make -f Make.linux )
  ( cd 9term && make -f Make.linux 9term wloc )

  ( cd sam && make -f Make.linux )
  ( cd samterm && make -f Make.linux )
}

package_9term() {
  pkgdesc="pre-plan9port version of the Plan9 terminal emulator 9term"

  cd ${srcdir}/${pkgbase}-${pkgver}.orig

  install -D -m755 9term/9term "${pkgdir}/usr/bin/9term"
  install -D -m755 9term/wloc "${pkgdir}/usr/bin/wloc"
  install -D -m644 9term/9term.1 "${pkgdir}/usr/share/man/man1/9term.1"
  install -D -m644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}

package_sam() {
  cd ${srcdir}/${pkgbase}-${pkgver}.orig

  pkgname=sam
  pkgver=4.3
  pkgrel=1
  pkgdesc="pre-plan9port version of the Plan9 editor sam"
  url="http://packages.debian.org/lenny/sam"

  install -D -m755 sam/sam "${pkgdir}/usr/bin/sam"
  install -D -m755 sam/B.sh "${pkgdir}/usr/bin/B"
  install -D -m755 sam/samsave "${pkgdir}/usr/lib/sam/samsave"
  install -D -m755 samterm/samterm "${pkgdir}/usr/lib/sam/samterm"
  install -D -m644 doc/sam.1 "${pkgdir}/usr/share/man/man1/sam.1"
  install -D -m644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
