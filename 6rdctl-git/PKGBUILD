# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=6rdctl-git
pkgver=20130107
pkgrel=1
pkgdesc="6rd Control Tool"
arch=("any")
conflicts=("6rdctl")
provides=("6rdctl")
url="https://github.com/felixonmars/6rdctl"
license=("GPL")
depends=('python' 'python-sh')

_gitroot=git@github.com:felixonmars/6rdctl.git
_gitname=6rdctl

build() {
  cd "$srcdir"
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  install -Dm755 "${srcdir}/$_gitname/$_gitname.py" "${pkgdir}/usr/bin/$_gitname"
}

# vim:set ts=2 sw=2 et:
