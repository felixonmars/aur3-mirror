# Contributor: Stijn Segers <francesco dot borromini at gmail dot com>

pkgname=beid
pkgver=4.0.4
pkgrel=1
pkgdesc="The eID Middleware software for using the Belgian eID on your computer"
arch=('any')
url="http://eid.belgium.be/"
license=('LGPL')
depends=('pcsclite' 'gtk2')
makedepends=('ccache' 'java-runtime')
optdepends=('eid-viewer')
source=('http://eid.belgium.be/nl/binaries/eid-mw-4%2E0%2E4-1253_tcm227-178475.tgz')
options=('makeflags')
sha1sums=('ddbc41d35f68e3205d03d3d56bf15702ae6c5595')

build() {

    cd "eid-mw-$pkgver"
    
    # This is temporary (but filthy) - we need to add the java compiler's location to the PATH
    # in order to use it. Since sensible people have only one java environment installed, we 
    # won't be doing any checking on whether we source twice instead of just once. 
    [ -e /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh

    # Run configure
    msg "Configuring beid"
    ./configure --prefix=/usr
    
    # Build
    msg "Running make" 
    make

}

package() {

    cd "eid-mw-$pkgver"
    msg "Running make install" 
    make DESTDIR=$pkgdir install

}
