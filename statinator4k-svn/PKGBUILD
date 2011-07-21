# Contributor: Patrice Peterson <runiq at archlinux dot us>
pkgname=statinator4k-svn
pkgver=32
pkgrel=1
pkgdesc="Info thing for dwm and other"
arch=('i686' 'x86_64')
url="http://0mark.unserver.de/statinator4k/"
license=('MIT')
depends=('dbus' 'alsa-lib')
makedepends=('subversion')
provides=(statinator4k)

_svntrunk="https://svn.0mark.unserver.de/statinator4k"
_svnmod=statinator4k

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

  # choose!
  make
  #make FORMATER=\"-DFORMAT_METHOD=\\\"formats_dwm_colorbar.h\\\"\"
  #make FORMATER=\"-DFORMAT_METHOD=\\\"formats_dwm_sprinkles.h\\\"\"
  #make FORMATER=\"-DFORMAT_METHOD=\\\"formats_dwm_html.h\\\"\"

  make PREFIX=/usr DESTDIR=$pkgdir install || return 1

  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE && \
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
}

