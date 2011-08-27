# Maintainer: Guan 'kuno' Qing <neokuno AT gmail DOT com>

pkgname=python2-couchdb-hg
_realname=couchdb-python
pkgver=20110426
pkgrel=1
pkgdesc="Python library for working with CouchDB, hg version."
url="http://code.google.com/p/couchdb-python/"
license=('BSD')
arch=(any)
depends=('python2>=2.7' 'python2-httplib2' 'couchdb')
makedepends=('python2-distribute' 'mercurial')
conflicts=('python-couchdb-svn')
provides=('python-couchdb')
#replace=('python-couchdb')
_hgtrunk="https://code.google.com/p/couchdb-python/"
_hgmod=$_realname

build() {
  cd "$srcdir" || return 1
  
  msg "Connect to mercurial repository server..."

  if [ ! -d "$_hgmod"/.hg ]; then
    hg clone "$_hgtrunk" "$_hgmod"
    cd "$_hgmod" || return 1
  else
    cd "$_hgmod" || return 1
    hg pull && hg update
  fi

  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:ts=2:sw=2:et
