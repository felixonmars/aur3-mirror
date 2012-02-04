# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at

pkgname=zsh-systemctl-git
pkgver=20110929
pkgrel=1
pkgdesc="ZSH functions to tab-complete systemctl (part of systemd) functions and services"
arch=('i686' 'x86_64')
url="https://github.com/foudfou/zsh-completion"
license=('GPL')
depends=('zsh')
makedepends=('git')
provides=('zsh-systemctl')
conflicts=('zsh-systemctl')
source=()
md5sums=()

_gitroot=git://github.com/foudfou/zsh-completion.git
_gitname=zsh-completion

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  install -d -m755 ${pkgdir}/usr/share/zsh/site-functions/
  install -m644 _systemctl ${pkgdir}/usr/share/zsh/site-functions/_systemctl
}

# vim:set ts=2 sw=2 et:
