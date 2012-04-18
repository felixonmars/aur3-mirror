# Maintainer: archtux <antonio dot arias99999 at gmail.com>

pkgname=marble-arena2
pkgver=1.2
pkgrel=1
pkgdesc="3D marble game, featuring vibrant HD graphics."
arch=('i686' 'x86_64')
url="http://www.marble-arena.com/"
license=('free')
depends=('webkit-sharp')
source=(http://www.marble-arena.com/update.php?get=linux
        ma2
        marble-arena2.desktop)
md5sums=('82a95ef2e822c317720d3fb16b0fe85d'
         'b9b78dbaa5f8b5b725867b90fdeac54b'
         '9868b4ecbcf12729f8494a589255cb59')

package() {
   cd $startdir

   tar xvzf update*
   mkdir -p $pkgdir/usr/share
   mv Marble\ Arena\ 2 $pkgdir/usr/share

   # Start file
   install -Dm755 ma2 $pkgdir/usr/bin/ma2

   # Desktop icon
   install -Dm644 marble-arena2.desktop $pkgdir/usr/share/applications/marble-arena2.desktop
   install -Dm644 $srcdir/Marble\ Arena\ 2/packages/models/marbles/marbles/30.png $pkgdir/usr/share/pixmaps/marble-arena2.png

   # Remove unneeded file depending on architecture used
   cd $pkgdir/usr/share/Marble\ Arena\ 2/bin
   if [ "${CARCH}" = 'x86_64' ]; then
   rm arena_32
     elif  [ "${CARCH}" = 'i686' ]; then 
   rm arena_64
   fi
}
