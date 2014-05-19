# Maintainer: Micael Dias <arch@micaeldias.com>
# Based on the community/imdbpy package

pkgname=imdbpy-hg
pkgver=871.80cae2453ec0
pkgrel=1
pkgdesc="Python bindings for the Internet Movie Database (IMDb)"
url="http://imdbpy.sourceforge.net/"
arch=('any')
license=('GPL')
provides=('imdbpy')
conflicts=('imdbpy')
depends=('python2')
makedepends=('python2-distribute' 'mercurial')
optdepends=('python2-lxml' 'python2-sqlalchemy' 'python2-sqlobject')
source=('hg+https://bitbucket.org/alberanid/imdbpy/')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/imdbpy"
  echo $(hg identify -n).$(hg identify -i)
}

package(){
  cd "$srcdir/imdbpy"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="$pkgdir" --optimize=1

  # fix paths
  # WTH is upstream doing?
  # TODO: report upstream about this nasty
  mv "$pkgdir/usr/etc" "$pkgdir"
  mkdir -p "$pkgdir/usr/share/doc"
  #mv "$pkgdir/usr/imdb" "$pkgdir/usr/share"
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/doc/imdb"
}

