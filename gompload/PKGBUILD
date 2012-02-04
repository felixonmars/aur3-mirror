# Maintainer: Scott Garrett <Wintervenom@gmail.com>
# Contributor: Scott Garrett <Wintervenom@gmail.com>

pkgname=gompload
pkgver=0.2
pkgrel=1
pkgdesc="A fancy ompload wrapper."
url="http://omploader.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ompload' 'html2text')
conflicts=('gomploader')
replaces=('gomploader')

#install=($pkgname.install)
source=(
	'gompload'
	'gompload.png'
	'gompload.desktop'
)
md5sums=(
	'010cf372e1fe000b96701e101e397d7d'
	'7872ec3a3b90fe2bae239fc596e7f4aa'
	'd57d419931f08ab515dbe4e5b4ec64d4'
)

build() {
  cd $srcdir
  mkdir $pkgdir/usr $pkgdir/usr/bin $pkgdir/usr/share $pkgdir/usr/share/pixmaps $pkgdir/usr/share/applications
  cp gompload $pkgdir/usr/bin
  cp gompload.png $pkgdir/usr/share/pixmaps
  cp gompload.desktop $pkgdir/usr/share/applications
  chmod a+x $pkgdir/usr/bin/gompload
  return 0
}
