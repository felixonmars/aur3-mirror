pkgname=eclipse2abs
pkgver=0.0.7
pkgrel=2
pkgdesc="A simple perl script to create an archlinux package for an eclipse plugin from its update site. This script will not work for the eclipse platform itself."
arch=(i686 x86_64)
url="https://github.com/lepokle/eclipse2abs"
license=('GPL3')
depends=('perl' 'perl-libwww' 'unzip')
source=("https://raw.githubusercontent.com/lepokle/eclipse2abs/version-$pkgver/resources/PKGBUILD.tmpl"
    "https://raw.githubusercontent.com/lepokle/eclipse2abs/version-$pkgver/src/eclipse2abs")
md5sums=('ffe3dbcf708713953c491b73a562a860' '396f7d855dccd8885c8c73e17e9688e4')

package() {
        mkdir -p $pkgdir/usr/bin
        mkdir -p $pkgdir/usr/share/doc/eclipse2abs
        
        cp eclipse2abs $pkgdir/usr/bin
        cp PKGBUILD.tmpl $pkgdir/usr/share/doc/eclipse2abs

        chmod 755  $pkgdir/usr/bin/eclipse2abs
}

post_install () {
    echo "Look at /usr/share/doc/eclipse2abs/PKGBUILD.tmpl for an example of an template file."
}
