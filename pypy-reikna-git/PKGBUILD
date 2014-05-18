# $Id: PKGBUILD 108485 2014-03-27 14:48:16Z fyan $
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgbase=pypy-reikna-git
pkgname=pypy-reikna-git
pkgver=0.2.0.0.658.gb6e628f
pkgrel=1
pkgdesc="Pure Python GPGPU library"
arch=('any')
url="http://reikna.publicfields.net/"
license=('MIT')
provides=('pypy-reikna')
conflicts=('pypy-reikna')
depends=('pypy-mako' 'pypy-numpy' 'pypy-funcsigs')
optdepends=('pypy-pyopencl')
makedepends=('pypy-setuptools')

_gitname=reikna

_gitroot=git://github.com/Manticore/reikna
_gitref=develop
exec 5>&1

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    git clean -fdx
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitref from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitref" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

pkgver() {
  (_fetch_git >&5 2>&1)
  cd "$srcdir/$_gitname"

  git describe | sed -e 's/^[^0-9]*//' -e 's/-/.0./' -e 's/-/./g'
}

build() {
  (_fetch_git)

  cd "$srcdir/$_gitname"
  pypy setup.py build
}

package() {
  cd "$srcdir/$_gitname"

  pypy setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
