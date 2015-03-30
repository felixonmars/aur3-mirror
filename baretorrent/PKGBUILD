# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=baretorrent
pkgver=0.4.4
pkgrel=2
pkgdesc="Portable bittorrent client with extensions based on libtorrent-rasterbar library."
arch=('i686' 'x86_64')
url="https://launchpad.net/baretorrent"
license=('custom:Public Domain')
depends=('gconf' 'gtk2' 'libidn' 'libpng12')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver-ubuntu-x64.7z
          $pkgname
          $pkgname.desktop)
md5sums=('22eeecd1d8897ddfd433f674d26bc36f'
         '5642247cdca4c3d97ae932ff4cb79d07'
         '14ab75d7260235b264d9730ccd0e2cca')
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver-ubuntu-x86.7z
          $pkgname
          $pkgname.desktop)
md5sums=('7b535db2304754bb5214dcc0de493185'
         '5642247cdca4c3d97ae932ff4cb79d07'
         '14ab75d7260235b264d9730ccd0e2cca')
fi

package() {

   # Data
   mkdir -p $pkgdir/usr/share/$pkgname
   cp -rf $srcdir/$pkgname-$pkgver-ubuntu*/* $pkgdir/usr/share/$pkgname

   # License
   install -Dm644 $pkgname-$pkgver-ubuntu*/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
   
   # Start file
   install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
   
   # Desktop icon
   install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
   install -Dm644 $pkgdir/usr/share/$pkgname/res/icon_512.png $pkgdir/usr/share/pixmaps/$pkgname.png
}