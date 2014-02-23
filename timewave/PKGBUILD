# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=timewave
pkgver=1.2
pkgrel=2
pkgdesc="A 2D space shooter in which the player can alter the flow of time."
arch=('i686' 'x86_64')
url="http://happypenguin.altervista.org/gameshow.php?t=Timewave"
license=('LGPL')
depends=('sdl_image' 'sdl_mixer')

if [ "$CARCH" == "x86_64" ]; then depends=('lib32-sdl_image' 'lib32-sdl_mixer')
elif  [ "${CARCH}" = 'i686' ]; then depends=('sdl_image' 'sdl_mixer')
fi

install=$pkgname.install
source=(http://greg-kennedy.com/wordpress/wp-content/uploads/2012/05/timewave.tar.gz
        timewave.sh
        timewave.desktop)
md5sums=('d980632109e8c75aff791e443af23410'
         '4e38d3593a1ae7da779b7a473de23d78'
         '4121223a648ce7623245197f7abbe8b9')


package() {
  cd $srcdir/$pkgname

  # Data
  mkdir -p $pkgdir/usr/share/games/$pkgname
  cp -r * $pkgdir/usr/share/games/$pkgname
  
  # Desktop icon
  install -Dm644 icon.png $pkgdir/usr/share/pixmaps/$pkgname.png

  cd ..
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Start file
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
}
