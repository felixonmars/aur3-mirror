# Contributor: Doug Newgard <scimmia22 at outlook dot com>

pkgname=undistract-me-git
_pkgname=undistract-me
pkgver=0.1.0.52.6b36304
pkgrel=1
pkgdesc="Alerts you when long-running commands finally complete"
arch=('any')
url="http://mumak.net/undistract-me/"
license=('Expat')
depends=('bash' 'notification-daemon' 'xorg-xprop')
makedepends=('git')
install=undistract-me.install
source=("git://github.com/jml/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(grep -m1 undistract-me debian/changelog | awk '{print $2}' | tr -d '()').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 long-running.bash "$pkgdir/usr/share/$_pkgname/long-running.bash"
  install -Dm755 preexec.bash "$pkgdir/usr/share/$_pkgname/preexec.bash"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm755 undistract-me.sh "$pkgdir/etc/profile.d/undistract-me.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
