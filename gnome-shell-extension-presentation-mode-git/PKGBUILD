# Contributor: alphazo <alphazo@gmail.com>
pkgname=gnome-shell-extension-presentation-mode-git
pkgver=20120427
pkgrel=1
pkgdesc="A gnome-shell extensions that adds an option for inhibiting the screensaver to the power menu."
arch=('any')
url="https://github.com/RaphaelKimmig/Gnome-Presentation-Mode"
license=('GPL')
groups=()
depends=('gnome-shell' 'gnome-screensaver')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
#source=
#md5sums=

_gitroot="git://github.com/RaphaelKimmig/Gnome-Presentation-Mode.git"
#_gitname="gnome-shell-extension-presentation-mode"
_gitname="Gnome-Presentation-Mode"

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
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/presentationmode@ampad.de"
  
  # Temporary fix until maintainer fixes git repo
  sed -i -e "s|3.2|3.4|" metadata.json

  mkdir -p $pkgdir/usr/share/gnome-shell/extensions/presentationmode@ampad.de
  cp -r * $pkgdir/usr/share/gnome-shell/extensions/presentationmode@ampad.de || return 1
}
