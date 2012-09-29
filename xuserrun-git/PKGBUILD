# Maintainer: Tom Vincent <http://tlvince.com/contact>
_pkgname=xuserrun
pkgname=$_pkgname-git
pkgver=20120929
pkgrel=1
pkgdesc="Run commands as the currently-active X11 user"
arch=(any)
url="https://github.com/rephorm/xuserrun"
license=('GPL')
depends=('systemd')
makedepends=('git')

_gitroot=https://github.com/rephorm/xuserrun
_gitname=$_pkgname

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
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
