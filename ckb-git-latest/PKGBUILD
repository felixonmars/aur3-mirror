# Maintainer: Penetal

pkgname=ckb-git-latest
pkgrel=2
pkgdesc="Corsair K65/K70/K95 Driver for Linux and OSX"
arch=('any')
url="https://github.com/ccMSC/ckb"
license=('GPL2')
depends=('qt5-base')
makedepends=('git' 'gcc')
install=ckb.install
source=('git://github.com/ccMSC/ckb.git')
md5sums=('SKIP')
_gitname="ckb"

replaces=('ckb-git')
conflicts=('ckb-git')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd "$srcdir/$_gitname"
  ./qmake-auto
  make
}

package() {
  cd "$srcdir/$_gitname/"
  
  install -d "$pkgdir/opt"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  
  cp -Rp "$srcdir/$_gitname/bin" "$pkgdir/opt/ckb"
  ln -s "/opt/ckb/ckb" "$pkgdir/usr/bin/ckb"
  chmod 755 "$pkgdir/opt/ckb/ckb"
  
  ln -s "/opt/ckb/ckb-daemon" "$pkgdir/usr/bin/ckb-daemon"
  chmod 755 "$pkgdir/opt/ckb/ckb-daemon"

  install -Dm644 "$srcdir/$_gitname/service/systemd/ckb-daemon.service" "$pkgdir/usr/lib/systemd/system/ckb-daemon.service"

  install -Dm644 "$srcdir/$_gitname/usr/ckb.desktop" "$pkgdir/usr/share/applications/ckb.desktop"

  install -Dm644 "$srcdir/$_gitname/usr/ckb.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ckb.png"
}
