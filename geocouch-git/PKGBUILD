# Maintainer: Roger Duran <rogerduran@gmail.com>

pkgname=geocouch-git
pkgver=20110227
pkgrel=1
pkgdesc="A fork of couchdb, document-oriented database that can be queried and indexed in a MapReduce fashion using JSON, with geospatial support"
arch=('i686' 'x86_64')
url="http://github.com/vmx/couchdb"
license=('APACHE')
depends=('icu' 'erlang' 'spidermonkey' 'openssl' 'curl')
makedepends=('gcc' 'git')
install=couchdb.install
options=('!libtool')
provides=('couchdb')
conflicts=('couchdb')

_gitroot="http://github.com/vmx/couchdb.git"
_gitname="couchdb"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    ./bootstrap || return 1
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
    make || return 1
}

package(){
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" install || return 1

    install -Dm755 etc/default/couchdb $pkgdir/etc/conf.d/couchdb
    sed -i 's|\(CONFIGURATION_FILE=/etc/\)default\(/couchdb\)|\1conf.d\2|' $pkgdir/etc/rc.d/couchdb
    sed -i 's|\(COUCHDB_OPTIONS=\)|\1"-p /var/run/couchdb/couchdb.pid"|' $pkgdir/etc/conf.d/couchdb
    sed -i 's|$COUCHDB -s|$COUCHDB $COUCHDB_OPTIONS -s|' $pkgdir/etc/rc.d/couchdb
    sed -i 's|su $COUCHDB_USER -c|su $COUCHDB_USER -s /bin/bash -c|' $pkgdir/etc/rc.d/couchdb

    # make rc.d pretty
    sed -i 's|#!/bin/sh -e|#!/bin/bash\n#general config\n. /etc/rc.conf\n. /etc/rc.d/functions|' $pkgdir/etc/rc.d/couchdb
    sed -i 's|# Start Apache CouchDB as a background process.|stat_busy "Starting the CouchDB daemon"|' $pkgdir/etc/rc.d/couchdb
    sed -i 's|# Stop the running Apache CouchDB process.|stat_busy "Stopping the CouchDB daemon"|' $pkgdir/etc/rc.d/couchdb
    sed -i 's|return $SCRIPT_OK|stat_done|' $pkgdir/etc/rc.d/couchdb
    sed -i 's|return $SCRIPT_ERROR|stat_fail|' $pkgdir/etc/rc.d/couchdb
}
