# Contributor: Piotr Kempa <piotr.kempa@wp.eu>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname="brother-hl2040"
pkgver="2.0.1"
pkgrel="2"
pkgdesc="Brother HL-2040 CUPS driver"
url="http://www.brother.com"
license=('custom:Brother Industries')
makedepends=('rpmextract')
arch=('i686' 'x86_64')
if [[ "$CARCH" == "x86_64" ]]; then
    depends=('lib32-glibc')
fi

source=('brother-hl2040.patch'
        'http://www.brother.com/pub/bsc/linux/dlf/brhl2040lpr-2.0.1-1.i386.rpm'
        'http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2040-2.0.1-1.i386.rpm'
)
sha256sums=('b8093acac22b6dc79609643d94fc1341716f2598877065290f42460030415016'
            'e123fe7030148c2842fa1859ccd89bd613c31fb7ec9c536032e42a1e0adeaece'
            'cff424e97b46c1de23b31a1a23f2edc5b78e5682bdc71222a39098b531c519f6')


build() {
    cd "$srcdir"

    for n in *.rpm; do
        rpmextract.sh "$n"
    done

    cd usr
    patch -p1 < ../brother-hl2040.patch
}

package()
{
    cd "$srcdir"
    "$srcdir/usr/local/Brother/cupswrapper/cupswrapperHL2040-2.0.1"

    install -d "$pkgdir/usr/share"
    cp -R "$srcdir/usr/bin" "$pkgdir/usr"
    cp -R "$srcdir/usr/lib" "$pkgdir/usr"
    cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/brother"

    rm "$pkgdir/usr/share/brother/cupswrapper/cupswrapperHL2040-2.0.1"
    rm "$pkgdir/usr/share/brother/inf/setupPrintcap"

    install -Dm644 ppd_file "$pkgdir/usr/share/cups/model/HL2040.ppd"
    install -Dm755 wrapper "$pkgdir/usr/lib/cups/filter/brlpdwrapperHL2040"
}
