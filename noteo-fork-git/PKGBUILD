# Contributor: Ben Duffield <jebavarde<AT>gmail.com>
pkgname=noteo-fork-git
pkgver=119.642f8f8
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="A notifications system"
url="http://code.google.com/p/noteo/"
license=("GPL")
makedepends=("git")
depends=("pygtk")
optdepends=('xmms2: xmms monitoring'
            'mpd: mpd monitoring'
            'libnotify: libnotify support')
provides=("notification-daemon")
replaces=("noteo" "noteo-notify" "noteo-awesome" "noteo-batterystatus" "noteo-gmailcheck" "noteo-mpd" "noteo-pacmanstatus" "noteo-output-macopix<=0.0.6")
conflicts=("noteo" "noteo-notify" "noteo-awesome" "noteo-batterystatus" "noteo-gmailcheck" "noteo-mpd" "noteo-pacmanstatus" "noteo-output-macopix<=0.0.6")

md5sums=("SKIP")
branch="master"
repo="https://github.com/npcardoso/noteo.git"
source=("git+$repo")

pkgver() {
  cd $srcdir/noteo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/noteo/src
  python2 setup.py install --prefix="usr/" --root="$pkgdir"
}
