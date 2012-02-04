# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=boost-endian-svn
pkgver=74617
pkgrel=3
pkgdesc='C++ library for manipulating the byte ordering of integers.'
arch=('any')
url='http://boost.cowic.de/rc/endian/doc/'
license=('custom')
depends=('boost')
makedepends=('subversion')
source=('http://www.boost.org/LICENSE_1_0.txt')
md5sums=('e4224ccaecb14d942c71d31bef20d78c')

_svntrunk=http://svn.boost.org/svn/boost/sandbox/endian
_svnmod=boost-endian

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
}

package() {
  cd "$srcdir/$_svnmod"
  for _file in $(find boost -type f -name "*.hpp"); do
    install -D -m644 "$_file" "$pkgdir/usr/include/$_file"
  done
  install -D -m644 "$srcdir/LICENSE_1_0.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE_1_0.txt"
}

