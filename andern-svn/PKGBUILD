# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Clayton Thompson <fiendskull9@gmail.com>

pkgname=andern-svn
pkgver=41
pkgrel=1
pkgdesc="a lightweight ID3v2 Tag editor written in python using GTK2"
arch=('i686')
url="http://fiendy.com/andern"
license="GPL"
depends=('gtk2' 'python2' 'pygtk' 'pyid3lib')
makedepends=('subversion')
provides=('andern')
source=()
md5sums=()

_svntrunk="http://andern.googlecode.com/svn/trunk/"
_svnmod="trunk"

build() {
  msg "Starting SVN checkout..."
  cd ${srcdir}
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
  msg "SVN checkout done or server timeout"

  msg "Creating build copy..."
  if [ -d ${srcdir}/$_svnmod-build ]; then
    rm -rf $_svnmod-build
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python2 setup.py install --root=${pkgdir}
}
