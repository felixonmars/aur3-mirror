# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@com.googlemail>

__pkgname="reddit"
pkgname="python2-${__pkgname}-git"
pkgver=20130306
pkgrel=1
pkgdesc="Python Reddit API"
url="https://github.com/praw-dev/praw"
arch=('any')
provides=("python2-${__pkgname}")
conflicts=("python2-${__pkgname}")
license=('GPL3')
depends=('python2' 'python2-requests' 'python2-update_checker')
makedepends=('git')

_gitroot="git://github.com/praw-dev/praw.git"
_gitname="praw"

build() {
  cd "$srcdir"

  msg "Connecting to github.com GIT server...."
  if [[ -d $_gitname ]] ; then
    ( cd "$_gitname" && git pull origin )
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"

  rm -rf "$_gitname-build"
  git clone "$_gitname" "$_gitname-build"

  cd "$_gitname-build"

  msg "Setting python version"
  sed -i 's|^#!/usr/bin/env python$|\02|' praw/tests/__init__.py
}

package() {
  cd "$_gitname-build"

  python2 setup.py install --root="$pkgdir"
}
# vim:set ts=2 sw=2 et:
