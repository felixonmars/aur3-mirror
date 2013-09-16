# Maintainer: Matthieu Froment <thieume2(at)hotmail(dot)com>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive3
pkgver=3.1.2_454
pkgrel=2
pkgdesc="Keeps data synchronised between various computers automatically."
arch=('i686' 'x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
depends=('')
if [[ "$CARCH" == "x86_64" ]]; then
   depends=('lib32-qt4'
         'lib32-glib2'
         'lib32-libxext'
         'lib32-libxrender'
         'lib32-fontconfig'
         'lib32-libsm'
         'lib32-sqlite'
         )         
fi
source=("http://s3download.teamdrive.net.s3.amazonaws.com/3.1.454/TMDR/linux/Install-TeamDrive-3.1.2.454_TMDR.run"
      "teamdrive3.desktop")
options=(!strip)
md5sums=('f4053c9216f62470053965528f56a424'
         '57b300b6333c515fd6785b5d8eda48a1')

build() {
    cd ${srcdir}
    chmod +x Install-TeamDrive-3.1.2.454_TMDR.run
}

package() {
    ./Install-TeamDrive-3.1.2.454_TMDR.run --mode unattended --prefix ${pkgdir}/opt/${pkgname}
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm "${pkgdir}/opt/${pkgname}/Uninstall TeamDrive 3.desktop"
    rm "${pkgdir}/opt/${pkgname}/uninstall"
}
