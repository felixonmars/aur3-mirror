pkgname=gnome-shell-extension-hotot-status-git
pkgver=20120424
pkgrel=1
epoch=
pkgdesc="A GNOME Shell extension that Hotot status icon in the top bar."
arch=('any')
url="https://github.com/astanin/hotot.shellex"
license=('unknown')
groups=()
depends=('gnome-shell' 'hotot-gtk3')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

_gitroot="https://github.com/astanin/hotot.shellex"
_gitname="hotot.shellex.localrepo"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  shellexdir="$pkgdir/usr/share/gnome-shell/extensions/shellex.hotot@astanin.github.com"
  mkdir -p "$shellexdir"
  cd "$srcdir/$_gitname"
  cp extension.js metadata.json "$shellexdir"
} 
