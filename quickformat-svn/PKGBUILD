# maintainer: Jekyll Wu <adaptee [at] gmail dot com >

pkgname=quickformat-svn
_pkgname=quickformat
pkgver=37399
pkgrel=1
pkgdesc="Format removable disk in a easy way. "
arch=('i686' 'x86_64')
url="http://www.pardus.org.tr"
license=('GPL')
depends=('kdebindings-python' 'pyparted' )
makedepends=('intltool' )

_svntrunk="http://svn.pardus.org.tr/uludag/trunk/kde/${_pkgname}"
_svnmod="${_pkgname}"

build() {

  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

}

package() {
  cd "$srcdir/$_svnmod-build/src"
  python2 ./setup.py install --root="${pkgdir}"

  # remove .svn directory
  cd "$pkgdir"
  find . -type d -a -iname '*.svn' -print0 | xargs -0 rm -rf

}
