# Maintainer: Guten Ye

pkgname="user-saber-server-daemon"
pkgver=0.1
pkgrel=4
pkgdesc="a saber server user daemon"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/saber"
license=("MIT")
depends=("user-daemon-system-git")
source=(
  "rc.saber-server"
  "conf.saber-server"
 )

package() {
  cd "$srcdir"

  install -Dm755 rc.saber-server "$pkgdir/home/$USER/etc/rc.d/saber-server"
  install -Dm644 conf.saber-server "$pkgdir/home/$USER/etc/conf.d/saber-server"
  chown $USER:$USER -R "$pkgdir/home/$USER"
}

# vim:set ts=2 sw=2 et:
md5sums=('074bb485183017fe8c32d9d163868295'
         '6685fd0ea983781040e38cd370244252')
