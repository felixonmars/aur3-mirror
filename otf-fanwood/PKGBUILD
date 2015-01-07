pkgname=otf-fanwood
pkgver=1.1
pkgrel=3
pkgdesc="MIT licensed opentype text font family based on Bitstream's Transitional 551"
arch=('any')
url="https://bitbucket.org/sortsmill/sortsmill-fonts"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=(https://bitbucket.org/sortsmill/sortsmill-fonts/downloads/fanwood-$pkgver.zip)
noextract=(fanwood-$pkgver.zip)
install=$pkgname.install
md5sums=('661b73db1ff67c3af4d49c70552d1d0b')

package() {
  cd $srcdir/
  unzip fanwood-$pkgver.zip 
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp *.otf $pkgdir/usr/share/fonts/OTF
}

