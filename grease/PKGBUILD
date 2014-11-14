# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=grease
pkgver=v0.1.18.gb6470c5
pkgrel=1
pkgdesc="A PHP editor written in PHP using xphp"
arch=('any')
url="https://github.com/AndrewRose/Grease"
license=('GNU')
depends=('xphp' 'xphp-pecl-wxwidgets' 'xphp-pecl-event' 'xphp-pecl-runkit' 'xphp-pecl-pthreads')
makedepends=('git')
source=('git+https://github.com/AndrewRose/Grease.git')
md5sums=('SKIP')

_gitname="Grease"

pkgver () {
  cd $srcdir/$_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd $srcdir/$_gitname
  
  install -d "$pkgdir/opt/grease"
  cp -r "ico" "$pkgdir/opt/grease"
  cp -r "Plugins" "$pkgdir/opt/grease"
  cp -r "Xdebugd" "$pkgdir/opt/grease"
  install -Dm644 "grease.php" "$pkgdir/opt/grease/grease.php"
  install -Dm644 "libxdebugd.php" "$pkgdir/opt/grease/libxdebugd.php"
  install -Dm644 "xdebugd.php" "$pkgdir/opt/grease/xdebugd.php"
  install -Dm644 "plugin.php" "$pkgdir/opt/grease/plugin.php"

  install -d "$pkgdir/usr/bin"
  echo "xphp -d open_basedir= /opt/grease/grease.php &" > $pkgdir/usr/bin/grease
  chmod +x $pkgdir/usr/bin/grease
}
