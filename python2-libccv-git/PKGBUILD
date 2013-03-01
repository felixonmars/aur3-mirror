# Maintainer: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=python2-libccv-git
pkgver=20130228
pkgrel=1
pkgdesc='Python2 binding for libccv (A Modern Computer Vision Library)'
arch=('any')
url='https://github.com/veezio/pyccv/'
license=('custom')
depends=('libccv')

_gitroot=${url}
_gitname=${pkgname}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
