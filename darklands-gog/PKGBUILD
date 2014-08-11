# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=darklands-gog
pkgver=1.0.0.6
pkgrel=1
pkgdesc="Role-plying in a medieval setting"
url="http://www.gog.com/game/darklands"
arch=('x86_64' 'i686')
license=('custom')
depends=('dosbox')
install='darklands-gog.install'
source=("file://darklands_1.0.0.6.tar.gz"
        "darklands.sh")
md5sums=('bcf5fb28ee3e718c9e47a20afb9de33e'
         'b1afff2ff87d1c49f37c1fd2b77c4b66')
sha512sums=('3fc4f22e0cde0f0b363740e0b85773d089d089c439c5800591661bc9bfe5cfdd4cd22fc528c617dcee87efe7fa8e162433bda0396f868b8a0923d1cc178908bc'
            'c62a214e3f8f7e79ed3dfbf88400354b88730cc825e150e78126b321da0a35e858164c334dfdc9f0e008e63ca343f3d583d274e684147c7c8e2ce446417f4ad7')

package() {
   mkdir -p "${pkgdir}/usr/share/applications/"
   install -Dm644 "${srcdir}/Darklands/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"
   install -Dm644 "${srcdir}/Darklands/support/gog-darklands.png" "${pkgdir}/usr/share/pixmaps/gog-darklands.png"
   install -Dm755 "${srcdir}/darklands.sh" "${pkgdir}/opt/Darklands/darklands.sh"

   sed "s/Exec=gog-darklands/Exec=\/opt\/Darklands\/darklands.sh/g" < "${srcdir}/Darklands/support/gog-darklands-primary.desktop" > "${pkgdir}/usr/share/applications/darklands.desktop"

   rm -r "${srcdir}/Darklands"/{start.sh,dosbox,support} "${srcdir}/Darklands/docs/dosbox-0.74.tar.gz" 
   cp -R "${srcdir}/Darklands" "${pkgdir}/opt"
   chmod 1775 "${pkgdir}/opt/Darklands/data/DARKLAND" "${pkgdir}/opt/Darklands/data/DARKLAND/SAVES"
   chmod 0664 "${pkgdir}/opt/Darklands/data/DARKLAND/SAVES/DEFAULT" "${pkgdir}/opt/Darklands/data/DARKLAND/"*.{LOG,TMP}
}
