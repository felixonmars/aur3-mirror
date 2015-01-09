# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=moleinvasion
pkgver=0.4
pkgrel=5
pkgdesc="Supertux clone about moles."
arch=('i686' 'x86_64')
url="http://moleinvasion.tuxfamily.org"
license=('GPL2')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
optdepends=('moleinvasion-music')
source=(ftp://download.tuxfamily.org/minvasion/packages/MoleInvasion-$pkgver.tar.bz2  $pkgname.desktop)
md5sums=('537ed079503d6ff2f8f9f1dd164126a0' '4a0065e968ac394a2c190e5079863498')

prepare() {
   cd $srcdir/$pkgname-$pkgver/src
   # Fix Makefile
   sed -i 's|SDL_ttf|SDL_ttf -ldl|' Makefile
}

build() {
   cd $srcdir/$pkgname-$pkgver/src
   CPPFLAGS+=" -O2"
   make clean
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver
   mkdir -p $pkgdir/usr/bin
   mkdir -p $pkgdir/usr/share/{$pkgname,applications}
   cp -r font gfx lin lvl music snd txt GPL_LICENSE.txt $pkgdir/usr/share/$pkgname

   # Links to binaries
   echo "cd '/usr/share/$pkgname/lin' && ./editor \"\$@"\" > $pkgdir/usr/bin/$pkgname-editor
   echo "cd '/usr/share/$pkgname/lin' && ./editworld \"\$@"\" > $pkgdir/usr/bin/$pkgname-editworld
   echo "cd '/usr/share/$pkgname/lin' && ./$pkgname" > $pkgdir/usr/bin/$pkgname
   chmod +x $pkgdir/usr/bin/{$pkgname-editor,$pkgname-editworld,$pkgname}

   # Desktop icon 
   install $srcdir/$pkgname.desktop $pkgdir/usr/share/applications

   # Man pages
   mkdir -p $pkgdir/usr/share/man/man6
   cp debian/*6 $pkgdir/usr/share/man/man6
}