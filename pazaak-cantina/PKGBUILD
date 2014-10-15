# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=pazaak-cantina
pkgver=2.1.6
pkgrel=1
pkgdesc="A standalone Pazaak game with multiplayer mode."
arch=('any')
url='http://www.pazaak.org/'
license=('custom') #author's permissions granted
depends=('java-environment')
makedepends=('unzip')
install='pazaak-cantina.install'
source=('http://www.pazaak.org/downloads/pazaakcantina.zip'
        'disclaimer.txt'
        'pazaak-cantina.desktop'
        'pazaak-cantina.install'
        'pazaak-cantina.sh')
md5sums=('b59b76267eb09008921188e581d1c86d'
         '14b1523937ea98429b29d67d083079ad'
         '79ae70ee715ce06aab607889025249e5'
         '512b3026f899aadfaec51c00fbed1930'
         'd6d09c321c25e73c818e69da7db23ecd')

package() {
    install -d -m755 "$pkgdir/usr/share/java/$pkgname"
    install -m644 "$srcdir/PazaakCantina.jar" "$pkgdir/usr/share/java/$pkgname"
    install -D -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -D -m644 "$srcdir/disclaimer.txt" "${pkgdir}/usr/share/licenses/${pkgname}/disclaimer.txt"
    cd "$srcdir"
    unzip "PazaakCantina.jar" "pazaakcantina/icons/icon48.png"
    install -D -m644 "pazaakcantina/icons/icon48.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
