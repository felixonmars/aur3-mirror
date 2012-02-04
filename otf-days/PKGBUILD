pkgname=otf-days
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Days is a sans serif, industrial, high tech font"
url="http://www.fontsquirrel.com/fonts/Days"
arch=('any')
license=('CC BY 3.0')
source=('days.otf')
install=$pkgname.install
md5sums=('fa2ea18afd661747039df6c78c4d7f2f')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp $srcdir/*.otf $pkgdir/usr/share/fonts/OTF
}
