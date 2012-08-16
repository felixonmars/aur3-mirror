# Contributor: Julian Rivera Pineda (xtecuan@NOSPAM.gmail.com)
pkgname=ttf-curlz_mt
pkgver=1.0
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
url="http://xtecuan.org/archlinux/packages/ttf-curlz_mt/"
source=(http://xtecuan.org/archlinux/packages/ttf-curlz_mt/ttf-curlz_mt.tar.bz2)
install=$pkgname.install
md5sums=('4b88fce16a3834e3d91032227045c2ae')
license=('GPL')
build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/$pkgname/*.ttf $pkgdir/usr/share/fonts/TTF
}
