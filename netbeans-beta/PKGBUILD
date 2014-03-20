# Maintainer: Evert Van Petegem <evert.van.petegem@gmail.com>

pkgname=netbeans-beta
pkgver=8.0
_subpkgver=201403101706
pkgrel=1
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++ beta'
arch=('any')
url='http://netbeans.org/'
license=('CDDL')
provides=('netbeans')
depends=('java-environment' 'ttf-font' 'libxtst' 'giflib' 'classpath')
backup=('usr/share/netbeans/etc/netbeans.conf')
conflicts=('netbeans')
makedepends=('gendesk' 'setconf' 'zip')
optdepends=('php: for developing programs in php'
            'groovy: for developing programs in groovy'
            'lib32-glibc')
install='netbeans-beta.install'
options=('!strip')
source=("http://dlc.sun.com.edgesuite.net/netbeans/8.0/final/zip/netbeans-$pkgver-$_subpkgver.zip")
md5sums=('06ebb16d404ae39df6186ab838840c60')

prepare() {
    gendesk -f -n --pkgname "netbeans" --pkgdesc "$pkgdesc"
    setconf "netbeans/bin/netbeans" basedir "/usr/share/netbeans"
}

package() {
    cd "netbeans"

    mkdir -p "$pkgdir/usr/"{bin,share/applications}
    cp -r "../netbeans" "$pkgdir/usr/share/"
    install -Dm644 "../netbeans.desktop" \
        "$pkgdir/usr/share/applications/netbeans.desktop"
    install -Dm644 "nb/netbeans.png" "$pkgdir/usr/share/pixmaps/netbeans.png"
    install -Dm755 "bin/netbeans" "$pkgdir/usr/bin/netbeans"

    rm -r "$pkgdir/usr/share/netbeans/bin"
}
