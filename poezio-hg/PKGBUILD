# Maintainer: mathieui <mathieui[at]mathieui.net>
# Contributor: mathieui <mathieui[at]mathieui.net>

pkgname=poezio-hg
pkgrel=2
pkgver=827
pkgdesc="A full-featured command-line irc-like (muc-centered) jabber client (hg)"
arch='any'
url="http://poezio.eu"
conflicts=('poezio')
provides=('poezio')
license=('zlib')
depends=('python' 'python-sleekxmpp-poezio')
makedepends=('mercurial' 'python-sleekxmpp-poezio')
optdepends=('python-dnspython-hg: SRV records support (also, gmail)')

_hgrepo="poezio"
_hgroot="http://hg.louiz.org/"

build() {
  cd "${srcdir}"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."

  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make
  make DESTDIR=$pkgdir prefix=/usr install
}
