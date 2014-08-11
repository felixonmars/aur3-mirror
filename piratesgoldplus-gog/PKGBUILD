# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=piratesgoldplus-gog
pkgver=1.0.0.6
pkgrel=1
pkgdesc="Sid Meier's pirate game, GoG-version running with dosbox"
url="http://www.gog.com/game/pirates_gold_plus"
arch=('x86_64' 'i686')
license=('custom')
depends=('dosbox')
install='piratesgoldplus-gog.install'
source=("file://pirates_gold_plus_1.0.0.6.tar.gz"
        "pirates-gold.sh"
        "pirates-classic.sh")
md5sums=('c374fe93f5dab936523a7ff85e7eebf5'
         '78d81895a4326c53ca27fa358a7dbc01'
         '849bf4eabb0efdfaba641e29447c370f')
sha512sums=('caa56b31d283c4f1ae525ff293c368dd198661157ff04afaffbaa12ecaa3650d157425d687a6f325af39afdfbfa942c0168f0da7cc199e1a23360aae98103323'
            'e1643e5a197adb9fcb989fd81af5c6b07f1b8ddbc5d06506fedd6c52a21600ea125ae9a0f717c88d4cd683d257f10bf19dd9dd73255b0e35c89e5c5a53e71005'
            '94e00666ab147ace5a63220fe860e46a75c55f00ee975dc31e189b922114aeaa7bf613bf7d5c4b5f51e0802d5f8660a8e02a18978dac17f3249013be4b24a126')

package() {
   mkdir -p "${pkgdir}/usr/share/applications/"
   install -Dm644 "${srcdir}/Pirates Gold Plus/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"
   install -Dm644 "${srcdir}/Pirates Gold Plus/support/gog-pirates-gold-plus.png" "${pkgdir}/usr/share/pixmaps/gog-pirates-gold-plus.png"
   install -Dm755 "${srcdir}/pirates-gold.sh" "${pkgdir}/opt/Pirates Gold Plus/pirates-gold.sh"
   install -Dm755 "${srcdir}/pirates-classic.sh" "${pkgdir}/opt/Pirates Gold Plus/pirates-classic.sh"

   sed "s/Exec=gog-pirates-gold-plus/Exec=\/opt\/Pirates Gold Plus\/pirates-gold.sh/g" < "${srcdir}/Pirates Gold Plus/support/gog-pirates-gold-plus-primary.desktop" > "${pkgdir}/usr/share/applications/pirates-gold.desktop"
   sed "s/Exec=gog-pirates-gold-plus --classic/Exec=\/opt\/Pirates Gold Plus\/pirates-classic.sh/g" < "${srcdir}/Pirates Gold Plus/support/gog-pirates-gold-plus-3.desktop" > "${pkgdir}/usr/share/applications/pirates-classic.desktop"

   rm -r "${srcdir}/Pirates Gold Plus"/{start.sh,dosbox,support} "${srcdir}/Pirates Gold Plus/docs/dosbox-0.74.tar.gz" 
   cp -R "${srcdir}/Pirates Gold Plus" "${pkgdir}/opt"
   chmod 1775 "${pkgdir}/opt/Pirates Gold Plus/data/PIRATESG.CD"
}
