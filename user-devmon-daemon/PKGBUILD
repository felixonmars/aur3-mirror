# Maintainer: Guten Ye

pkgname="user-devmon-daemon"
pkgver=0.1
pkgrel=1
pkgdesc="a devmon user daemon. READ https://github.com/GutenYe/user-daemon-system for Installion Instruction"
arch=("i686" "x86_64")
url="http://ignorantguru.github.com/udevil"
license=("MIT")
depends=("user-daemon-system-git")
backup=("home/$USER/etc/conf.d/devmon")
source=("rc.devmon"
        "conf.devmon")

package() {
  cd "$srcdir"

  install -Dm755 rc.devmon "$pkgdir/home/$USER/etc/rc.d/devmon"
  install -Dm644 conf.devmon "$pkgdir/home/$USER/etc/conf.d/devmon"

  chown $USER:$USER -R "$pkgdir/home/$USER"
}

# vim:set ts=2 sw=2 et:
md5sums=('30277daef121811c232dd5eb8a39c2d0'
         '6685fd0ea983781040e38cd370244252')
