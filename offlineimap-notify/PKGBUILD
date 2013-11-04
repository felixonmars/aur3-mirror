# Maintainer: Raymond Wagenmaker <raymondwagenmaker@gmail.com>
pkgname=offlineimap-notify
pkgver=0.5.1
_taghash=b6bb67ea6a5e # Bitbucket tarballs have silly names
pkgrel=1
pkgdesc="Wrapper that adds notification sending to OfflineIMAP"
arch=(any)
url="https://bitbucket.org/raymonad/offlineimap-notify"
license=('GPL3')
depends=('offlineimap' 'python2-setuptools')
makedepends=('python2-docutils')
optdepends=('python2-notify: send notifications via D-Bus')
source=("https://bitbucket.org/raymonad/$pkgname/get/v$pkgver.tar.gz")
md5sums=('9d0b71dbbdd5dcd95ef1ab3f94d57974')

build() {
  cd "$srcdir/raymonad-$pkgname-$_taghash"
  rst2man2 offlineimap-notify.rst offlineimap-notify.1
}

package() {
  cd "$srcdir/raymonad-$pkgname-$_taghash"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 offlineimap-notify.1 "$pkgdir"/usr/share/man/man1/offlineimap-notify.1
  install -Dm644 NEWS "$pkgdir"/usr/share/doc/offlineimap/NEWS
}

# vim:set ts=2 sw=2 et:
