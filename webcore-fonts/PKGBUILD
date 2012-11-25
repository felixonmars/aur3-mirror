# Contributor:Fabrizio Antonangeli <fabrizio.antonangeli@gmail.com>
pkgname=webcore-fonts
pkgver=3.0
pkgrel=3
pkgdesc="Collection of minimum popular high quality TrueType fonts"
url="http://avi.alkalay.net/software/webcore-fonts/"
source=(http://avi.alkalay.net/software/webcore-fonts/$pkgname-$pkgver.tar.gz)
md5sums=('0ca029d7135f7afdba00be6280ff96c6')
install=webcore-fonts.install
arch=('any')
license=('EULA')

build() {
  cd $srcdir/$pkgname

  mkdir -p $pkgdir/usr/share/fonts/webcore
  mkdir -p $pkgdir/usr/share/fonts/webcore-vista
  mkdir -p $pkgdir/usr/share/doc/webcore-fonts

  mv fonts/* $pkgdir/usr/share/fonts/webcore
  mv vista/* $pkgdir/usr/share/fonts/webcore-vista
  mv doc/* $pkgdir/usr/share/doc/webcore-fonts
}
