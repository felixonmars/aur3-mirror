# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=chandler64
pkgver=1.0.3
pkgrel=3
pkgdesc="A notebook you can back up, organize, and share."
arch=(x86_64)
url=http://chandlerproject.org
license=(APACHE)
depends=(hicolor-icon-theme libpng12 libjpeg6-turbo
    python2-{configobj,dateutil,m2crypto,parsedatetime,pyicu,pylucene,vobject,zanshin}
    swig twisted wxgtk wxpython zope-interface)
makedepends=(python2-distribute)
options=(!emptydirs !libtool)
install=$pkgname.install
source=(http://downloads.osafoundation.org/chandler/releases/$pkgver/Chandler_intrepid_$pkgver-1_amd64.deb
    chandler)
sha256sums=('5a0b3ab5f428911f958f5e6dd667d59d3354dd1e26fb281b6319cbe2d93d51e0'
    '16bc0651736d9cc31bdc85483b92eaa78cb0def2000549688fe8a28361aa9730')
sha512sums=('ffe8da52328c784b6d6cd768a5ad7adffc051fe244281c616bfaaa6bd618d82235e055312bb911772cf7f0c481fe9708f8068c9c07d7d5e2370efba873a93b08'
    '594a2976f6c7460c7a7b44762a0c14b8ffc6cd575e6c6ad20aed1461190315c3cf32de2f02d7351f3c9c58d7f52b246861e31175f5ce1eb0033926e204ea0372')

package() {
    cd "$pkgdir"
    bsdtar -xf "$srcdir"/data.tar.gz
    find -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
    install -Dm755 "$srcdir"/chandler usr/bin/chandler
}
