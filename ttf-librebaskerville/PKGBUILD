pkgname=ttf-librebaskerville
pkgver=1.0
pkgrel=1
pkgdesc="Open source version of Baskerville serif typeface in regular, italic and bold"
arch=('any')
url="http://www.impallari.com/projects/overview/libre-baskerville"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=(http://www.impallari.com/media/uploads/prosources/update-86-source.zip)
noextract=(update-86-source.zip)
install=$pkgname.install
md5sums=('b9a7656f62e06fdee0086c39a446b28b')

build()
{
  cd $srcdir/
  unzip -j update-86-source.zip '*.ttf'
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp *.ttf $pkgdir/usr/share/fonts/TTF
}

