# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=shadowrunreturns-gog
pkgver=1.0.0.4
pkgrel=1
pkgdesc="A science fantasy turn based tactical role-playing game, GOG-edition"
url="http://www.gog.com/game/shadowrun_returns"
arch=('x86_64' 'i686')
license=('custom')
source=("gog_shadowrun_returns_${pkgver}.tar.gz"
        "shadowrunreturns.sh")
md5sums=('7951fdad70f2962b4de14e34075d6f6c'
         'eed3a4730450b9c2f707660ced0db98e')
sha512sums=('2954dbdb88f4850a3c005bad1103344ab2bc1a6ca4b2e0b2abaec7836260a590b35d881b959b9922c0633726ee1bc023610b343b56fd94d758762ddfc6c26063'
            '7532f6f00b8330a02f90c10e5df5563b6f8259900e08c2ff92b9098c8348749364b52d517e39d250050c2b70903fab3c4883954e5855fb2399fa252a98ab7e22')

if [[ $CARCH == 'i686' ]]; then
  depends=(glu libxcursor qt4)
else
  depends+=(lib32-{glu,libxcursor,qt4})
fi

package() {
   mkdir -p "${pkgdir}/usr/share/applications/"
   mkdir -p "${pkgdir}/opt/Shadowrun Returns/"
   cp -R "${srcdir}/Shadowrun Returns" "${pkgdir}/opt"
   sed "s/Exec=gog-shadowrun-returns/Exec=\/usr\/bin\/shadowrunreturns.sh/g" < "${srcdir}/Shadowrun Returns/support/gog-shadowrun-returns-primary.desktop" > "${pkgdir}/usr/share/applications/shadowrun-returns.desktop"
   install -Dm644 "${srcdir}/Shadowrun Returns/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/Shadowrun Returns/support/gog-shadowrun-returns.png" "${pkgdir}/usr/share/pixmaps/gog-shadowrun-returns.png"
   install -Dm755 "${srcdir}/shadowrunreturns.sh" "${pkgdir}/usr/bin/shadowrunreturns.sh"
   ln -s "/tmp/Shadowrun Returns" "${pkgdir}/opt/Shadowrun Returns/game/DumpBox"
}
