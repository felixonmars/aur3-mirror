# Base on a PKGBUILD from Anton Bazhenov <anton.bazhenov at gmail> 
# Maintainer : Biginoz <biginoz _at_ free _point_ fr>
# Maintainer: Adrián Chaves Fernández <adriyetichaves@gmail.com>
# Desktop entry (with icon) was added by Chris Baker <baker.chris.3@gmail.com>

pkgname=violetland

pkgver=0.4.3
pkgrel=1
pkgdesc="Game where a girl, Violet, struggles with hordes of monsters."
arch=('any')
url="http://code.google.com/p/violetland/"
license=('GPL3' 'CCPL:by-sa')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'libgl')
makedepends=('cmake' 'boost')
conflicts=('violetland-svn')

source=(http://violetland.googlecode.com/files/$pkgname-v$pkgver-src.zip
        violetland.desktop
        violetland.png)         

    

md5sums=('55b21ecd2871630b934d702b9a776921'
         '2fb37ae4beb732c6824d2e18df83cf8b'
         '863bc89bd05a694b456977953a95c5a0')
         
build() {
  cd $srcdir/$pkgname-v$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
}
package() {
  cd $srcdir/$pkgname-v$pkgver
  make DESTDIR="$pkgdir" install || return 1
  install -D -m644 $srcdir/violetland.desktop $pkgdir/usr/share/applications/violetland.desktop
  install -D -m644 $srcdir/violetland.png $pkgdir/usr/share/pixmaps/violetland.png
}
