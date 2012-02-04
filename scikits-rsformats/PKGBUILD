# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=scikits-rsformats
pkgver=0.1
pkgrel=1
pkgdesc="Tools for reading remote sensing formats"
arch=('any')
url="http://scikits.appspot.com/rsformats"
license=('BSD')
depends=('python2' 'scikits-base' 'python2-numpy' 'python2-pyhdf' 'python2-pyparsing')
makedepends=('subversion' 'python2-distribute')
options=(!emptydirs)

build() {
  _svntrunk=http://svn.scipy.org/svn/scikits/tags/rsformats-$pkgver/
  _svnmod=rsformats
  _svnver=1242
  cd "$srcdir"

  if [ -d "$_svnmod"/.svn ]; then
    (cd "$_svnmod" && svn up -r "$_svnver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$_svnver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$_svnmod-build"
  svn export "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build"

  python2 setup.py install --root="$pkgdir"/ --optimize=1 || return 1
  rm "$pkgdir/`python2 -c 'from distutils.sysconfig import get_python_lib; \
    print get_python_lib()'`/scikits/__init__.py"
}

