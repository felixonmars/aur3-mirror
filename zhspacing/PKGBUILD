# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=zhspacing
pkgver=080102
pkgrel=1
pkgdesc="XeTeX macro for typesetting mixed Chinese documents with punctuation spacing adjustment and prohibitions"
arch=(i686 x86_64)
url="http://code.google.com/p/zhspacing/"
depends=('texlive-bin')
source=(http://zhspacing.googlecode.com/files/${pkgname}${pkgver}.tar.bz2)
license=('LGPL')
install=(zhspacing.install)
md5sums=('1a20526e903b8c0527b51914d53c663c')

build()
{
  cd $startdir/src
  mkdir -p $pkgdir/usr/share/texmf/tex/xelatex/zhspacing
  install -m 644 *.sty $pkgdir/usr/share/texmf/tex/xelatex/zhspacing 
}
