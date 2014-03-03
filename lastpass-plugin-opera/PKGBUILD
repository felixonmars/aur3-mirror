# Maintainer: AlexJF <alexandrejorgefonseca at gmail dot com>

pkgname=lastpass-plugin-opera
pkgver=3.0.19
pkgrel=1
license=unknown
pkgdesc="Binary plugin to be used in combination with lastpass's Opera extension"
url="http://helpdesk.lastpass.com/safaribinary/"
depends=(opera)
makedepends=(unzip)
arch=(i686 x86_64)
source=(https://lastpass.com/download/cdn/lpchrome_linux.crx)
md5sums=(1be53762da177d331dcc23bbc6f75e0d)

package() {
    cd $srcdir
    mkdir -p opera
    # Echo is here cause unzip returns non-0 on warning, failing the package
    # function
    echo `unzip -q -o "lpchrome_linux.crx" -d "opera"`

    if [ $CARCH == "x86_64" ] 
    then
        NPLASTPASS=libnplastpass64.so
    else
        NPLASTPASS=libnplastpass.so
    fi

    mkdir -p $pkgdir/usr/lib/opera/plugins
    cp -f opera/$NPLASTPASS $pkgdir/usr/lib/opera/plugins/
}
