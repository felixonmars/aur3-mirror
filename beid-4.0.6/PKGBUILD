# Contributor: Sandro Munda <sandro@munda.me>

pkgname=beid-4.0.6
pkgver=4.0.6
pkgrel=1
pkgdesc="The eID Middleware software for using the Belgian eID on your computer"
arch=('any')
url="http://eid.belgium.be/"
license=('LGPL')
depends=('pcsclite' 'gtk2')
makedepends=('ccache' 'java-runtime')
optdepends=('eid-viewer')
source=('http://eid.belgium.be/fr/binaries/eid-mw-4.0.6-1480.tar_tcm226-250016.gz')
options=('makeflags')
sha1sums=('88d839353eb75dd4cda6a1eb8153de15f62e11f9')

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
