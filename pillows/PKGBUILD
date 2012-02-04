# Contributor: Nick Bolten <Shirakawasuna at gmail _dot_com>

pkgname=pillows
pkgver=0.2.1
pkgrel=2
pkgdesc="An exciting “save-the-world” arcade game with a very unique premise."
url="http://fydo.net/projects/pillows"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2' 'python-pygame')
source=(http://fydo.net/programming/$pkgname-v${pkgver}.zip
        pillows.desktop
        pillows.sh)

md5sums=('17c2811f154cfd666d0f0d46901d6b24'
         'd024127c5bf0f05357aea1fe9a8a32b8'
         'ed5159e82ada432bb2b9fba58d26fe2f')

build() {

  #Install the game
  install -d -m755 $pkgdir/usr/share
  cp -r $srcdir/$pkgname-v${pkgver} $pkgdir/usr/share/pillows

  #Install the .desktop file
  install -D -m644 $srcdir/pillows.desktop $pkgdir/usr/share/applications/pillows.desktop

  #Install the bin file
  install -D -m755 $srcdir/pillows.sh $pkgdir/usr/bin/pillows

}

# vim:set ts=2 sw=2 et:
md5sums=('17c2811f154cfd666d0f0d46901d6b24'
         'd024127c5bf0f05357aea1fe9a8a32b8'
         'd79a2cac195c7eda55f0798b9631e902')
