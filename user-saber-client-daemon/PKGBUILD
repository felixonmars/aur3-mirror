# Maintainer: Guten Ye

pkgname="user-saber-client-daemon"
pkgver=0.1
pkgrel=5
pkgdesc="a saber client user daemon"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/saber"
license=("MIT")
depends=("user-daemon-system-git")
source=(
  "rc.saber-client"
  "conf.saber-client"
  )

package() {
  cd "$srcdir"

  install -Dm755 rc.saber-client "$pkgdir/home/$USER/etc/rc.d/saber-client"
  install -Dm644 conf.saber-client "$pkgdir/home/$USER/etc/conf.d/saber-client"
  chown $USER:$USER -R "$pkgdir/home/$USER"
}

# vim:set ts=2 sw=2 et:
md5sums=('1a71d1bbdcd980e5f973de9c92f070f5'
         '6685fd0ea983781040e38cd370244252')
