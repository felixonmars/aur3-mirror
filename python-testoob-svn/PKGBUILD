# Contributor: giniu <gginiu@gmail.com>
pkgname=python-testoob-svn
pkgver=1008
pkgrel=1
pkgdesc="Advanced Python testing framework."
arch=('any')
url="http://code.google.com/p/testoob/"
license=('Apache')
depends=('python')
makedepends=('subversion' 'setuptools')
provides=('python-testoob')
conflicts=('python-testoob')
options=(!emptydirs)

_svntrunk=http://testoob.googlecode.com/svn/trunk
_svnmod=TestOOB

build() {
  cd "$srcdir"

  if [ -d "$_svnmod"/.svn ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$_svnmod-build"
  svn export "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build"

  python setup.py install --root="$pkgdir"/ --optimize=1 || return 1
}

