# $Id: PKGBUILD,v 1.10 2006/12/14 18:44:43 damir Exp $
# Maintainer : R. S. Ananda Murthy <rsamurti@airtelbroadband.in>
pkgname=latex-xft-fonts
pkgver=0.1
pkgrel=1
pkgdesc="TTF Fonts required to display math symbols in equations in LyX."
arch=("i686" "x86_64")
url="ftp://ftp.lyx.org/pub/lyx/contrib/"
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=("ftp://ftp.lyx.org/pub/lyx/contrib/$pkgname-$pkgver.tar.gz")
md5sums=(0f3275e403be5fdbd14117dd8a26675f)

build()
{
  cd ${startdir}/src/$pkgname-${pkgver}
  mkdir -p  ${startdir}/pkg/usr/share/fonts/TTF/
  install -m 644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF
}
