# Contributor: Markus Gross (xsdnyd [at] gmail.com)

pkgname=hets-svn
pkgver=9727
pkgrel=1
pkgdesc="Hets is a parsing, static analysis and proof management tool \
combining various tools for different specification languages, thus providing \
a tool for the heterogeneous specification language HetCASL."
url="http://www.informatik.uni-bremen.de/agbkb/forschung/formal_methods/CoFI/hets/index_e.htm"
arch=(i686)
license=CUSTOM
depends=('haxml>=1.13.2' 'ghc>=6.8.2' 'udrawgraph>=3.1.1' 'tcl' 'tk' 'spass' 'hets-lib')
makedepends=('subversion')
provides=('hets')
source=()
md5sums=()

_svntrunk=https://svn-agbkb.informatik.uni-bremen.de/Hets/trunk
_svnmod=hets

build() {
  cd $startdir/src

  if [ -d uni/.svn ]
  then
      (cd uni && svn up)
  else
      svn co https://svn-agbkb.informatik.uni-bremen.de/uni/trunk --config-dir ./ uni
  fi

  if [ -d $_svnmod/.svn ]
  then
      (cd $_svnmod && svn up -r $pkgver)
  else
      svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Building uniform framework"

  cd $startdir/src/uni

  ./configure --with-bdb=/usr

  make cabal || return 1

  cd $startdir/src

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Building $_svnmod"

  make packages || return 1
  #make depend || return 1
  make hets || return 1

  mkdir -p $startdir/pkg/usr/bin/
  install -Dm755 hets $startdir/pkg/usr/bin/$_svnmod

  #install license
  mkdir -p $startdir/pkg/usr/share/licenses/$_svnmod
  install -Dm644 LICENSE.txt $startdir/pkg/usr/share/licenses/$_svnmod/LICENSE

  rm -rf $startdir/src/$_svnmod-build
}
# vim:syntax=sh
