# Maintainer: Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=3.3.1.1047
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
arch=('i686' 'x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
depends=('')

if [[ "$CARCH" == "x86_64" ]]; then
    source=("http://s3download.teamdrive.net.s3-eu-west-1.amazonaws.com/3.3.1047/TMDR/linux-x86_64/Install-TeamDrive-3.3.1.1047_TMDR.run"
            "teamdrive.desktop") 
    md5sums=('5d7ddef4f983b4c595cb24883183c9e9'
             '8f2b28fb16574d3dc1ea3cf9081c2caf')        
else
    
    source=("http://s3download.teamdrive.net.s3-eu-west-1.amazonaws.com/3.3.1047/TMDR/linux/Install-TeamDrive-3.3.1.1047_TMDR.run"
            "teamdrive.desktop") 
    md5sums=('7f3cb03e0aef108f442e60c53e958f8e'
             '8f2b28fb16574d3dc1ea3cf9081c2caf')
fi

options=(!strip)

build() {
    cd ${srcdir}
    chmod +x Install-TeamDrive-${pkgver}_TMDR.run
}

package() {
    ./Install-TeamDrive-${pkgver}_TMDR.run --mode unattended --prefix ${pkgdir}/opt/${pkgname}
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm "${pkgdir}/opt/${pkgname}/Uninstall TeamDrive 3.desktop"
    rm "${pkgdir}/opt/${pkgname}/uninstall"
}
