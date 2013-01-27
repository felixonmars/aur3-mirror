pkgname=python2-obspy-git
pkgver=20130127
pkgrel=1
pkgdesc="A Python Toolbox for seismology/seismological observatories."
arch=('i686' 'x86_64')
url="http://obspy.org/"
license=('GPL3')
groups=()
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'python2-lxml' 'python2-suds' 'python2-sqlalchemy')
makedepends=('git' 'python2-distribute')
provides=('obspy')
conflicts=('obspy')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()
sha256sums=()

_gitroot=git://github.com/obspy/obspy.git
_gitname=obspy

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

  python2 setup.py build --verbose || return 1

  find . -name "*.py" -print | xargs sed -i 's@^#!\s*/usr/bin/env\s\s*python$@#!/usr/bin/env python2@'
  find . -name "*.py" -print | xargs sed -i 's@^#!\s*/usr/bin/python$@#!/usr/bin/env python2@'
}

package() {
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --verbose --root="$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et:
