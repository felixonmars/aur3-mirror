# Maintainer: Scott Garrett <Wintervenom@gmail.com>
# Contributor: Scott Garrett <Wintervenom@gmail.com>

pkgname=gomploader
pkgver=0.1.1
pkgrel=1
pkgdesc="A graphical ompload wrapper."
url="http://omploader.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ompload' 'html2text')
optdepends=('zenity: file picker dialog')

#install=($pkgname.install)
source=(
	'gompload'
	'gompload.png'
	'gompload.desktop'
)
md5sums=(
	'862b719d40cf582b13c07d5a1fed86f5'
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
