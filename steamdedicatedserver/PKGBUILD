# Maintainer: MarkZZ <mark.weiman at markzz dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaaze.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=steamdedicatedserver
pkgver=34
pkgrel=3
pkgdesc="Valve Steam Dedicated Server for Linux - Depreciated by SteamCMD by Valve"
url="http://developer.valvesoftware.com/wiki/HLDSUpdateTool"
arch=('i686' 'x86_64')
depends=('glibc')
[ "$CARCH" = "x86_64" ] && depends=('lib32-glibc')
optdepends=('screen: manage multiple servers conveniently')
install=steamdedicatedserver.install
source=(http://storefront.steampowered.com/download/hldsupdatetool.bin \
        steamdedicatedserver.install http://aur.markzz.com/steamdedicatedserver/helperscripts.tar.gz)
license=('custom')
md5sums=('3d92b54b74387e3881b35b92d09d8e16'
         '7a173c56f066ffbe11f9fffabae64128' 
         'cb61ac35b710c0e7f6adc12c10750625')
build() {
    cd ${srcdir}
    chmod 755 hldsupdatetool.bin || exit 1
    # You agree this since you want this.
    echo yes | ./hldsupdatetool.bin || exit 1
	
    install -d -m755 ${pkgdir}/opt/steamdedsrv/
    install -D -m755 *.sh ${pkgdir}/opt/steamdedsrv/
    install -D -m755 ./steam ${pkgdir}/opt/steamdedsrv/steam
    install -D -m444 ./readme.txt ${pkgdir}/opt/steamdedsrv/readme.txt
}
