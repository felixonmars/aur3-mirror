# Contributor: Piotr Kujawski <piotr@lao.pl>
pkgname=icegilgrey
pkgver=1
pkgrel=1
pkgdesc="Theme for IceWM based on the Gilouche Metacity theme."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/icegilgrey/"
license=('GPL')
groups=('x11')
depends=('icewm')
source=(http://download.freshmeat.net/themes/$pkgname/$pkgname-default-$pkgver.tar.gz)
md5sums=('94bd483223050ab2ebdc217a4385a57e')

build() {
  install -d $pkgdir/usr/share/icewm/themes/IceGil\ Grey
  cp -R $srcdir/IceGil\ Grey  $pkgdir/usr/share/icewm/themes/
}

# vim:set ts=2 sw=2 et:
