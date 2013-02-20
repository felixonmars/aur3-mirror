# Maintainer: Jiangge Zhang <tonyseek at gmail dot com>

pkgname=python2-mirbuild-git
pkgver=20130220
pkgrel=1
pkgdesc="The Last.fm MIR meta-build-system."
arch=('i686', 'x86_64')
url="https://github.com/lastfm/python-mirbuild"
license=('custom')
depends=('cmake'
         'python2'
         'python2-debian'
         'python2-dateutil'
         'python2-chardet')
makedepends=('git' 'python2-distribute')
provides=('python-mirbuild' 'mirbuild')

_python=python2
_gitroot=git://github.com/lastfm/python-mirbuild.git
_gitname=python-mirbuild

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

  $_python build.py configure
}

package() {
  cd "$srcdir/$_gitname-build"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
