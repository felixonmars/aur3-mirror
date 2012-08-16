#Maintained by BKLive <benjamin dot kuhns at gmail dot com>

pkgname=euclid-wm-svn
pkgver=216
pkgrel=1
pkgdesc="SVN branch of euclid-wm: A minimalist, tiling window manager for X11"
arch=('i686' 'x86_64')
url="http://euclid-wm.sourceforge.net/index.php"
license=('custom')
depends=('libx11')
makedepends=('subversion')

_svntrunk=http://euclid-wm.googlecode.com/svn/trunk
_svnmod=euclid-wm-read-only

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

  make || return 1
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir" install || return 1
}
