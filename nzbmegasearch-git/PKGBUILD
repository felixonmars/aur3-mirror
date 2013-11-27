# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="nzbmegasearch-git"
pkgver=0.46.r0.g404b707
pkgrel=2
pkgdesc="Aggregate automatically NZB search results."
arch=(any)
url="http://pillone.github.io/usntssearch/"
license=('GPL2')
depends=('python2')
optdepends=('sabnzbd: a popular NZB downloader')
makedepends=('git')
install=${pkgname}.install
source=("$pkgname::git://github.com/pillone/usntssearch.git"
        'mega2.sh' "${pkgname}.install" 'nzbmegasearch.service')
noextract=()
md5sums=('SKIP'
         'bad650791ba5621983e8d6bbfc184614'
         '41260e0b443c7bb7af1e876168bb1b53'
         '5a45779c6ac83ef4a2351187ff8603af')

pkgver() {
    cd $pkgname
    git describe --tags --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd $srcdir

    install -d -m 755 "$pkgdir/opt/nzbmegasearch"
    cp -dpr --no-preserve=ownership "$srcdir/$pkgname/NZBmegasearch"/* "$pkgdir/opt/nzbmegasearch"
    #mkdir -p "$pkgdir/opt/nzbmegasearch"
    #chmod 775 "$pkgdir/opt/nzbmegasearch"
    #cp -r $pkgname/* "$pkgdir/opt/nzbmegasearch"

    install -D -m644 nzbmegasearch.service "$pkgdir/usr/lib/systemd/system/nzbmegasearch.service"
    install -D -m755 mega2.sh "$pkgdir/usr/bin/mega2"
}
