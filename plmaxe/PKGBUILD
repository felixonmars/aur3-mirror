# Maintainer: Trizen ( trizenx at gmail dot com )

pkgname=plmaxe
pkgver=0.14
pkgrel=1
pkgdesc="Plmaxe is a script written in Perl, built with the same idea as Pymaxe: downloading of music and videos from media sharing sites. Unlike Pymaxe, this application works only in command-line, being very useful for those who preffer CLI."
arch=('any')
url="http://pymaxe.com"
license=('GPL')
depends=('perl-libwww' 'wget')
optdeps=('mplayer')
source=(http://trizen.go.ro/files/$pkgname)
md5sums=('079a53779bfe1e3f738e83b897753b67')

build() {
  install -Dm 755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
