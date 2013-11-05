# Maintainer: rasmus@gmx.us

pkgname=python2-mpltools-git
pkgver=v0.1.21.g1d4c339
pkgrel=1
pkgdesc="mpltools provides tools for matplotlib that make it easier to adjust the style"
url="http://tonysyu.github.com/mpltools/index.html"
arch=('i686' 'x86_64')
license=('bsd')
depends=('python2-matplotlib' 'python2-configobj')
makedepends=('git')
source=("$pkgname"::'git://github.com/tonysyu/mpltools.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}


# docs () {
#   cd "$pkgname/doc"
#   sed -i -e "s|python|python2|" Makefile
#   make html
# }

build() {
  cd "$pkgname"

   # python2 fix
  for file in $(find . -name '*.py' -print); do
      sed -i -e "s|^#!.*/usr/bin/python|#!/usr/bin/python2|" \
             -e "s|^#!.*/usr/bin/env *python|#!/usr/bin/env python2|" ${file}
   done
}



package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
