# Contributor: Dave Reisner <d@falconindy.com>

pkgname=initscripts-systemd-git
pkgver=20120122
pkgrel=1
pkgdesc="Arch specific systemd initialization/bootup scripts for systemd"
arch=('any')
url="http://www.github.com/falconindy/initscripts-systemd"
license=('GPL')
depends=('systemd-git')
provides=("initscripts-systemd=$pkgver")
conflicts=('initscripts-systemd')
makedepends=('git')
install=initscripts-systemd.install

_gitroot="git://github.com/falconindy/initscripts-systemd.git"
_gitname="initscripts-systemd"

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  make -C "$srcdir/$_gitname-build" DESTDIR="$pkgdir" install
}
