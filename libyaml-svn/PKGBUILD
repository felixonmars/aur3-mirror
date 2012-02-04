# Contributor: Michal Bozon <bozonm@vscht.cz>
pkgname=libyaml-svn
pkgver=258
pkgrel=1
pkgdesc="YAML 1.1 library, SVN version"
arch=('i686' 'x86_64')
url="http://pyyaml.org/wiki/LibYAML"
license=('MIT')
conflicts=('libyaml')
provides=('libyaml')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://svn.pyyaml.org/libyaml/trunk
_svnmod=libyaml-trunk

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  cd $_svnmod
  ./bootstrap || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install || return 1
  install -m644 -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
