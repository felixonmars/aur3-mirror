# Maintainer: Brian Galey <bkgaley at gmail dot com>
# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=geocouch
pkgver=1.3.1
pkgrel=1
pkgdesc='A CouchDB add-on to support geospatial indexing and queries.'
arch=('i686' 'x86_64')
url='https://github.com/couchbase/geocouch'
license=('Apache')
depends=('couchdb')
source=("https://github.com/couchbase/$pkgname/tarball/couchdb1.3.x")
install='geocouch.install'
sha256sums=('a2a115c5e8316cdcbf061d5f8fca3c410a89d6fb88becf3d539f22ad7c2c4862')
_gitrev='e34c628'

build() {
    cd "$srcdir/couchbase-$pkgname-$_gitrev"
    # Not in a git repo, so replace the git command with this version.
    sed -i "/VERSION=/ s/=.*/=$pkgver/" Makefile
    local couchver=$(couch-config --couch-version)
    COUCH_SRC="$(couch-config --erl-libs-dir)/couch-$couchver/include" make
}

package(){
    cd "$srcdir/couchbase-geocouch-$_gitrev"
    install -d -m755 -o couchdb -g daemon $pkgdir/etc/couchdb/default.d
    install -m644 -o couchdb -g daemon etc/couchdb/default.d/geocouch.ini $pkgdir/etc/couchdb/default.d/geocouch.ini
    install -d $pkgdir/usr/share/couchdb/www/script/test
    install -t $pkgdir/usr/share/couchdb/www/script/test share/www/script/test/*
    install -d $pkgdir/usr/lib/couchdb/erlang/lib/geocouch/ebin
    install -t $pkgdir/usr/lib/couchdb/erlang/lib/geocouch/ebin ebin/*
}
