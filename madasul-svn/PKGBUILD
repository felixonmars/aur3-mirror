# Contributor: Stefan Mark <mark_at_unserver_dot_de>
pkgname=madasul-svn
pkgver=36
pkgrel=2
pkgdesc="a tinytiny media playing daemon"
arch=('i686' 'x86_64')
url="http://0mark.unserver.de/madasul/"
license=('GPL')
makedepends=('subversion')
optdepends=('mpg321: play mp3'
'vorbis-tools: play ogg and read meta tags from ogg'
'id3: read meta tags from mp3'
'mplayer: plays everything else')

_svntrunk="https://svn.0mark.unserver.de/madasul"
_svnmod=madasul

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
  make PREFIX=/usr DESTDIR=$pkgdir install || return 1

  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE && \
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
}
