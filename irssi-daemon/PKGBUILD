# Maintainer: Guten Ye

pkgname="irssi-daemon"
pkgver=0.1
pkgrel=4
pkgdesc="a daemon for irssi"
arch=("i686" "x86_64")
url="http://www.irssi.org"
license=("MIT")
depends=("user-irssi-daemon")
backup=("etc/conf.d/irssi")
source=("rc.irssi"
        "conf.irssi")

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 rc.irssi "$pkgdir/etc/rc.d/irssi"
  install -Dm644 conf.irssi "$pkgdir/etc/conf.d/irssi"
}

# vim:set ts=2 sw=2 et:
md5sums=('e8936c3149f5cadd88e7d09ca89b4453'
         '77f1ed6fd2e097de1c14127a81ebf4ce')
