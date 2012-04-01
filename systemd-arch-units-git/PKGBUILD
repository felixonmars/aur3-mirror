# Contributor: Dave Reisner <d@falconindy.com>

pkgname=systemd-arch-units-git
pkgver=20110722
pkgrel=1
pkgdesc="Arch specific Systemd unit files"
arch=('any')
url="http://github.com/falconindy/systemd-arch-units"
license=('MIT')
depends=('systemd-git')
makedepends=('git')
groups=('systemd')
provides=('systemd-arch-units')
conflicts=('systemd-arch-units')
install=systemd-arch-units.install

_gitroot="git://github.com/falconindy/systemd-arch-units.git"
_gitname="systemd-arch-units"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -a "$srcdir/$_gitname/" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}
