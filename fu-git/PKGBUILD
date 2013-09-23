# Maintainer: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=fu-git
pkgver=2013.09.15.gdd34258
pkgrel=1
pkgdesc="A simple commandline utility for querying commandlinefu.com"
url="https://github.com/samirahmed/fu"
arch=(any)
license=('MIT')
depends=('python2')
makedepends=('git' 'python2-setuptools')

_gitroot="git://github.com/samirahmed/fu.git"
_gitname="fu"

pkgver() {
    cd "${srcdir}/${_gitname}"
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"

  python2 setup.py -q install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
