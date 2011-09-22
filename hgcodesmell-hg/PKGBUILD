# Maintainer: vae77 <fernandogrd@.com>

pkgname=hgcodesmell-hg
pkgver=23
pkgrel=2
pkgdesc="Small hg extension to warn about questionable code changes on commit."
arch=('any')
install=$pkgname.install
url="http://mercurial.selenic.com/wiki/CodesmellExtension"
license=('GPL')
depends=('python2')
makedepends=('mercurial')

_hgroot="https://hg@bitbucket.org/birkenfeld"
_hgrepo="hgcodesmell"


build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"

}

package() {

  install -D -m644 $_hgrepo/hgcodesmell.py $pkgdir/usr/lib/python2.7/site-packages/hgcodesmell.py

}
