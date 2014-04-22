# Maintainer: Buce <dmbuce@gmail.com>

pkgname=parcman-git
pkgver=0.r38.gc27bfd9
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=2
pkgdesc="A collection of pacman-related tools"
arch=(any)
url="https://github.com/DMBuce/parcman"
license=('BSD')
groups=()
depends=('openssh' 'pacman' 'bash' 'patch' 'vim' 'reflector')
makedepends=('git')
provides=(parcman)
conflicts=(parcman pacrepo)
replaces=()
backup=('etc/parcman.conf')
options=()
install=
source=("$pkgname::git://github.com/DMBuce/parcman")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make prefix=/usr sysconfdir=/etc localstatedir=/var libexecdir=/usr/lib
}

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr sysconfdir=/etc localstatedir=/var libexecdir=/usr/lib DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
