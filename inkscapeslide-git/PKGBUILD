# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 
pkgname=inkscapeslide-git
pkgver=20130111
pkgrel=1
pkgdesc="Make Presentations with inkscape"
arch=('i686' 'x86_64')
url="https://github.com/abourget/inkscapeslide"
license=('')
depends=('python2' 'python2-lxml' 'python2-pypdf')
makedepends=('git')

_gitroot="git://github.com/abourget/inkscapeslide.git"
_gitname="inkscapeslide"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot 
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "applying patch"
  sed -i "s|/usr/bin/python|/usr/bin/python2|" inkscapeslide/__init__.py
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
} 
