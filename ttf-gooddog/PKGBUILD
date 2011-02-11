# Contributor: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=ttf-gooddog
_pkgname=gooddog
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Hand writing like true type font"
arch=('any')
license=('EULA')
source=('http://dl.dropbox.com/u/52420/AUR/GoodDog.zip')
url="http://www.fontsquirrel.com/fonts/GoodDog"
install=$pkgname.install
md5sums=('a60d20cd3122800054e7e2908ee3289b')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.otf $pkgdir/usr/share/fonts/TTF
}

