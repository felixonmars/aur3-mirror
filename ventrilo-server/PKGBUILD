# Maintainer: Ryon Sherman <ryon.sherman@gmail.com>
# Contributor: Nick Campbell <s0ma AT thenagryfist DOT net>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=ventrilo-server
pkgver=3.0.3
pkgrel=5
pkgdesc="Voice communication server for games and group discussions"

provides=('ventrilo-server=3.0.3')

arch=('i686' 'x86_64')
license=('custom')
url="http://www.ventrilo.com/"

[ "$CARCH" = x86_64 ] && depends=('lib32-glibc')
makedepends=('lynx')

install=ventrilo-server.install
source=("${pkgname}.service")
md5sums=('1f7a9cbbd4ff0e18880dec3880b603f2')


package() {
    if [ ! -f ventrilo_srv-${pkgver}-Linux-i386.tar.gz ]; then
        ### WE NEED TO DOWNLOAD THE CLIENT MANUALLY BECAUSE OF THE LICENSE ###
        msg "============================================================================"
        msg ""
        msg "Because of its license, the Ventrilo server needs to be downloaded manually."
        msg "For this purpose, Lynx will be opened to ventrilo.com."
        msg ""
        msg "You will need to:"
        msg "  1) Read the license"
        msg "  2) Scroll down to 'I Agree'"
        msg "  3) Save the file with the default name"
        msg "  4) Close the browser (press Q)"
        msg ""
        msg "Press a key to open ventrilo.com..."
        msg ""
        msg "============================================================================"

        read -n 1 -s
        lynx -cookies http://www.ventrilo.com/dlprod.php?id=102
    fi

    if [ ! -f ventrilo_srv-${pkgver}-Linux-i386.tar.gz ]; then
        msg "ventrilo_srv-${pkgver}-Linux-i386.tar.gz missing, aborting..."
        exit 1
    fi

    tar xzf ventrilo_srv-${pkgver}-Linux-i386.tar.gz

    install -d ${pkgdir}/{opt/ventsrv,usr/share/licenses/{$pkgname}}

    install -Dm774 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
    install -Dm644 ${srcdir}/ventsrv/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    touch ${srcdir}/ventsrv/ventrilo_srv.log

    cp -r ${srcdir}/ventsrv ${pkgdir}/opt
}
