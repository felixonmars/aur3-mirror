# Maintainer: Sergiy Kukunin <sergey.kukunin SPAN gmail.com>


pkgname=lightum-xbacklight-git
pkgver=20121031
pkgrel=2
pkgdesc="MacBook automatic keyboard brightness daemon with xbacklight backend (for not Gnome and KDE users)"
arch=('x86_64' 'i686')
url="https://github.com/Kukunin/lightum"
license=(GPL)
groups=()
depends=('dbus-glib' 'libxss' 'libx11' 'libxext' 'xorg-xbacklight')
makedepends=('git')
optdepends=()
provides=()
conflicts=(lightum)
replaces=(lightum)
backup=()
options=()
changelog=
noextract=()

_gitroot=git://github.com/Kukunin/lightum.git
_gitname=lightum

build() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  msg "Change the branch"
  git checkout xbacklight

  make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

