# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Jose Negron <josenj@gmail.com>

pkgname=genmake
pkgver=1.1
pkgrel=2
pkgdesc="A program to generate nice/simple Makefiles for Linux/Unix and MS Windows"
arch=('any')
url="http://www.muquit.com/muquit/software/genmake/genmake.html"
license=('GPL')
depends=('perl')
source=('http://www.muquit.com/muquit/software/genmake/genmake.txt')
md5sums=('cfc9cd4a52e49d33db020fe5f6bfa8da')

package () {
  install -m 755 -D $srcdir/$pkgname.txt $pkgdir/usr/bin/$pkgname
}
