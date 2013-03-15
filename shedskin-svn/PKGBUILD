# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=shedskin-svn
pkgver=1507
pkgrel=2
pkgdesc='Python to C++ compiler'
arch=('any')
url="http://code.google.com/p/shedskin/"
license=('GPL2')
depends=('pcre' 'gc' 'python2')
makedepends=('subversion' 'python2')
provides=('shedskin')
conflicts=('shedskin')
_svntrunk=http://shedskin.googlecode.com/svn/trunk/
_svnmod=shedskin
source=("python27.patch")
sha256sums=('13f5be6a9127632b35762f9db9879f589ed76ff36651341bc1f138a99a0420c4')

build() {
  cd "$srcdir"

  # Checking out from SVN
  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cd "$_svnmod"

  # Python 2.7 support
  patch -p0 < $srcdir/python27.patch
}

package() {
  cd "$srcdir/$_svnmod"

  mkdir -p "$pkgdir/usr/bin"
  python2 setup.py install --prefix="$pkgdir/usr"
  install -Dm755 scripts/shedskin "$pkgdir/usr/bin/shedskin"
  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
