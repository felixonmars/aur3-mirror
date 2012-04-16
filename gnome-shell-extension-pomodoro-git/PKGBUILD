# Maintainer: Juanma Hernandez <juanmah@gmail.com>

pkgname=gnome-shell-extension-pomodoro-git
pkgver=20120416
pkgrel=1
pkgdesc="GNOME Shell extension for pomodoro technique."
arch=('any')
url="https://github.com/codito/gnome-shell-pomodoro"
license=('MIT')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
makedepends=('git')
install='gschemas.install'

_gitroot="https://github.com/codito/gnome-shell-pomodoro.git"
_gitname="gnome-shell-pomodoro"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd ${srcdir}/${_gitname}
  ./autogen.sh --prefix=${pkgdir}/usr --disable-schemas-compile
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make install
}
