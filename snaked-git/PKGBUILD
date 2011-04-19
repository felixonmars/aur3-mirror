# Maintainer: Shu <shu@shuu.ru>
pkgname=snaked-git
pkgver=20110419
pkgrel=1
pkgdesc="Very light and minimalist editor inspired by Scribes, indented mostly for python developers, but other users may find it useful too."
arch=('i686' 'x86_64')
url="http://github.com/baverman/snaked"
license=('MIT')
depends=('python2' 'pygtk>=2.10' 'pygtksourceview2>=2.10' 'python2-chardet' 'python2-rope' 'pyflakes' 'python2-distribute')
makedepends=('python2')

_gitroot="git://github.com/baverman/snaked.git"
_gitname="snaked"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone --depth=1 ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_gitname}-build
  python2 setup.py install --root=$startdir/pkg

  install -D -m664 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf ${_gitname}-build
}

# vim:set ts=2 sw=2 et:
