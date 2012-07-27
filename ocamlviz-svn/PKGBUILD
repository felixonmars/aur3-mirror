# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocamlviz-svn
pkgver=428
pkgrel=4
pkgdesc="Real-time profiling tool"
url="http://ocamlviz.forge.ocamlcore.org/"
arch=('i686' 'x86_64')
license=('LGPL2' 'custom: QPL-1.0')
depends=('ocaml' 'lablgtk2' 'ocaml-cairo' 'graphviz')
makedepends=('subversion')
provides=('ocamlviz')
source=(no-icon.patch)
md5sums=('9e50cba0ca6f7739f51889f676ebd33b')

_svntrunk="svn://scm.ocamlcore.org/svn/ocamlviz/"
_svnmod="ocamlviz"

build() {
  cd "$srcdir"
  msg "Connecting to svn.forge.ocamlcore.org SVN server...."
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up -r $pkgver
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -e "$srcdir"/$_svnmod-build ]; then
    rm -rf "$srcdir"/$_svnmod-build
  fi

  svn export "$srcdir"/$_svnmod "$srcdir"/$_svnmod-build
  cd "$srcdir"/$_svnmod-build
  patch -Np1 -i "$srcdir/no-icon.patch"

  autoconf || return 1
  ./configure --prefix="$pkgdir/usr" || return 1
  make || return 1
}

package() {
  cd "$srcdir"/$_svnmod-build
  ocamllib="$pkgdir/`ocamlc -v | tail -1 | cut -f 4 -d " "`"
  mkdir -p "$ocamllib/camlp4"
  make OCAMLLIB="$ocamllib" install || return 1
  install -D -m 644 LICENSE $pkgdir/usr/share/licenses/ocamlviz/LICENSE
}
