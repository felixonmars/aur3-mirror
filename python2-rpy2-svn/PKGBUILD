# Maintainer: Oliver Sherouse <firstname DOT lastname AT gmail DOT com>
# Contributor: David Scholl <djscholl@gmail.com> 
# Contributor: David Pretty <david.pretty@gmail.com> 
# Contributor: Leon Belmont <meow TA linux DoT cn> 
pkgname=python2-rpy2-svn
pkgver=730
pkgrel=2
pkgdesc="A very simple, yet robust, Python interface to the R Programming Language."
arch=('i686' 'x86_64')
url="http://rpy.sourceforge.net/"
license=('MPL' 'GPL' 'LGPL')
depends=('python2-numpy' 'r')
conflicts=('python2-rpy2')
provides=('python2-rpy2')
#source=("http://pypi.python.org/packages/source/r/rpy2/rpy2-$pkgver.tar.gz")
#md5sums=('aa9c0c3120716705b28127323cc4ac6d')

_svnmod=python2-rpy2-svn
_svntrunk=https://rpy.svn.sourceforge.net/svnroot/rpy/rpy2/trunk

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  cd "$srcdir/$_svnmod"
  sed -i "s:Rlapack:lapack:" setup.py
  sed -i "s:'python':'python2':" rpy/rinterface/tests/test_EmbeddedR.py
  sed -i "s:os.path.join(RHOME.strip(), 'include'):'/usr/include/R':" setup.py
  sed -i "s:os.path.join(RHOME.strip(), 'include'):'/usr/include/R':" setup.py
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 || return 1
  mkdir -p "$pkgdir"/etc/ld.so.conf.d
  echo /usr/lib/R/lib > "$pkgdir"/etc/ld.so.conf.d/rpy_$CARCH.conf
}
