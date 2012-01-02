# Maintainer: Mark Buck <m_buck@hotmail.com>
pkgname=python-twitter-hg
pkgver=241
pkgrel=1
arch=('any')
pkgdesc="A python wrapper around the Twitter API."
url="http://code.google.com/p/$pkgname/"
license=('APACHE')
depends=('python-simplejson' 'python2-oauth2' 'python2-httplib2')
optdepends=()
makedepends=('python2' 'mercurial')
install=
source=()
md5sums=()

_hgroot="http://python-twitter.googlecode.com/hg/"
_hgrepo="python-twitter"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-$pkgver"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-$pkgver"
}

package() {
  cd "$srcdir/$_hgrepo-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
