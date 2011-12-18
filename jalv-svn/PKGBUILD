# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=jalv
pkgname=$_pkg-svn
pkgver=3882
pkgrel=1
pkgdesc="Run an LV2 plugin as a JACK application."
arch=(i686 x86_64)
url="http://drobilla.net/software/$_pkg/"
license=('custom:ISC')
depends=('lilv>=0.8.0' 'suil')
makedepends=('subversion' 'python2' 'lv2-event' 'lv2-atom'
             'lv2-uri-map' 'lv2-state' 'lv2-ui-resize')
provides=("$_pkg")
conflicts=("$_pkg")

_svntrunk=http://svn.drobilla.net/lad/trunk/$_pkg
_svnmod=$_pkg

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

  #
  # BUILD
  #

  LDFLAGS="-lpthread" \
  python2 waf configure --prefix=/usr \
                        --mandir=/usr/share/man
  python2 waf
}

package() {
  cd "$srcdir/$_svnmod-build"

  DESTDIR="$pkgdir/" python2 waf install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
