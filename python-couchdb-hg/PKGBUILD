# Maintainer: Your Name <youremail@domain.com>
pkgname=python-couchdb-hg
pkgver=20130429.3b0f6d6d9e31
pkgrel=1
pkgdesc="Python library for working with CouchDB"
arch=(any)
url="http://code.google.com/p/couchdb-python/"
license=('BSD')
depends=('python2>=2.7' 'python2-httplib2' 'couchdb')
makedepends=('python2-distribute' 'mercurial')

_hgroot=https://code.google.com/p
_hgrepo=couchdb-python

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot/$_hgrepo" "$_hgrepo" -u ${pkgver:9}
  fi

  msg "Mercurial checkout done (or server timeout)"
  msg "Preparing build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

	msg "Building..."
	python2 setup.py build
}

package() {
	msg "Packaging..."
	cd "$srcdir/$_hgrepo-build"
	python2 setup.py install --root=$pkgdir --optimize=1

  cd $pkgdir/usr/lib/python2.7/site-packages/couchdb/
  mv client.py client.py.aurbak
  cp $srcdir/$_hgrepo/couchdb/client.py $pkgdir/usr/lib/python2.7/site-packages/couchdb/client.py
}
