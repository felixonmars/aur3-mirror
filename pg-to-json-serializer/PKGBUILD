# Maintainer: Eduard Kracmar <edke.kraken (at) gmail.com>

pkgname=pg-to-json-serializer
pkgver=15
pkgrel=1
pkgdesc="Set of functions for serializing PostgreSQL variable values into JSON presentation"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pg-to-json-serializer/"
license=('GPL3')
depends=('postgresql>=9.0.0')
provides=('pg-to-json-serializer')
conflicts=('pg-to-json-serializer')
options=()
install=
changelog=
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://pg-to-json-serializer.googlecode.com/svn/trunk/
_svnmod=trunk

build() {
    cd "$srcdir"
    
    msg "Checkout/up of pg-to-json-serializer, connecting to code.google.com/p/pg-to-json-serializer..."
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg "SVN checkout done"
    msg "Starting make..."
    
    cd "$srcdir/$_svnmod"
    make
}

package() {
    cd "$srcdir/$_svnmod"
    make DESTDIR="$pkgdir/" install
    mkdir -p $pkgdir/usr/share/postgresql/contrib/
    cp install.sql $pkgdir/usr/share/postgresql/contrib/serializer.sql
}


