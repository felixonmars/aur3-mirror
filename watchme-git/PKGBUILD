# Maintainer: Pierre-Olivier Vauboin <povauboin at gmail dot com>

pkgname=watchme-git
pkgver=41.68617b5
pkgrel=1
pkgdesc="Displays system logs on screen using OSD"
arch=('any')
url="https://github.com/looran/watchme"
license=('BSD')
depends=('python2-systemd' 'python-aosd' 'python2-setproctitle')
makedepends=('')
source=('git+https://github.com/looran/watchme.git')
sha1sums=('SKIP')
_gitname="watchme"

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
