# Maintainer: Varakh <varakh[at]varakh[dot]de>
pkgname=vpaste
pkgver=1.0.0
pkgrel=1
pkgdesc="vpaste bash script for uploading to paste.varakh.de"
url="http://aur.varakh.de"
license=('GPL')
arch=('any')
source=("http://aur.varakh.de/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('2af72452808c830d4b98c85710e3ab55')

# server doesn't like the curl header
DLAGENTS="$( IFS=$'\n'; echo "${DLAGENTS[*]}" | grep '^http::' ) --user-agent 'Mozilla/4.0'"

package() {
    chmod +x $srcdir/usr/bin/vpaste
    cp -rf $srcdir/usr/ $pkgdir || return 1
}
