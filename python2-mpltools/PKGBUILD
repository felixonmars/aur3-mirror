# Maintainer: Mitchel Humpherys <mitch.special@gmail.com>
# Contributor: Hector Martinez-Seara Monne <hseara##a##gmail##.##com>

pkgname=python2-mpltools
pkgver=20120910
pkgrel=1
pkgdesc="mpltools provides tools for Matplotlib that make it easier to adjust the style"
url="http://tonysyu.github.com/mpltools/index.html"
arch=('i686' 'x86_64')
license=('bsd')
depends=('python2-matplotlib' 'python-configobj')
makedepends=('git')

_gitroot='https://github.com/tonysyu/mpltools.git'
_gitname='mpltools'

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build

  cd $srcdir/$_gitname-build

   # python2 fix
   for file in $(find . -name '*.py' -print); do
      sed -i -e "s|^#!.*/usr/bin/python|#!/usr/bin/python2|" \
             -e "s|^#!.*/usr/bin/env *python|#!/usr/bin/env python2|" ${file}
   done

}

package() {
  cd "$srcdir/$_gitname/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
