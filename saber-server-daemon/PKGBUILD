# Maintainer: Guten Ye

pkgname="saber-server-daemon"
pkgver=0.1
pkgrel=5
pkgdesc="a saber server daemon"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/saber"
license=("MIT")
depends=("user-saber-server-daemon")
source=("rc.saber-server" "conf.saber-server")

package() {
  cd "$srcdir"

  install -Dm755 rc.saber-server "$pkgdir/etc/rc.d/saber-server"
  install -Dm644 conf.saber-server "$pkgdir/etc/conf.d/saber-server"
}

# vim:set ts=2 sw=2 et:
md5sums=('b99bd85bc11f3177ed92012e4428d948'
         '77f1ed6fd2e097de1c14127a81ebf4ce')
