#Maintainer : Ashen91 fresh at yandex dot com

pkgname=batang-ttc
pkgver=1.0
pkgrel=3
depends=('fontconfig' 'xorg-font-utils')
license=('GPL')
url=('https://code.google.com/p/batang-ttc/')
pkgdesc="Korean Default Batang Font"
arch=('i686' 'x86_64')
source=(https://batang-ttc.googlecode.com/git/$pkgname.tar.gz)
md5sums=('f220c3a82944b019cd36ec7f7217fe42')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname/"*.ttc "$pkgdir/usr/share/fonts/TTF/"
}

