# Maintainer: Themaister <maister@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
pkgname=snesfilter
pkgver=0.082
pkgrel=1

_pkgbase=bsnes
_pkgver=082

pkgdesc="bsnes library for output filters."

arch=('i686' 'x86_64')
url="http://byuu.org/bsnes/"
license=('GPL2')
makedepends=('gcc>=4.5')
source=("http://bsnes.googlecode.com/files/${_pkgbase}_v${_pkgver}-source.tar.bz2")
md5sums=('c7deead3fb28bcf1aa7bcef44f236f59')

build() 
{
  cd "${srcdir}/bsnes_v${_pkgver}-source/snesfilter"

  make compiler=gcc || return 1
}

package()
{
  cd "${srcdir}/bsnes_v${_pkgver}-source/snesfilter/out"
  mkdir -p "${pkgdir}/usr/lib/snesfilter"

  install -m644 *.filter "${pkgdir}/usr/lib/snesfilter"
}

