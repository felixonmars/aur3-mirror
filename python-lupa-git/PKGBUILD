# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Exaos Lee <Exaos.Lee@gmail.com>
pkgname=python-lupa-git
pkgver=20120408
pkgrel=3
pkgdesc="Intergrate the LuaJIT2 runtime into CPython"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/lupa"
license=('MIT')
depends=('luajit>=2.0.0b9' 'python2')
provides=('python2-lupa-git')
conflicts=('python2-lupa')
replaces=('python2-lupa')

_gitroot="git://github.com/scoder/lupa.git"
_gitname="lupa"

build() {
  cd $startdir/
  msg "Connecting to GIT server ..."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "Local copy is updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make ..."

  rm -rf "$_gitname-build"
  git clone "$_gitnmae" "$_gitname-build"
  cd "$_gitname-build"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

# vim:set ts=2 sw=2 et:
