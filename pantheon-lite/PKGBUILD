# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-lite
pkgver=1
pkgrel=2
pkgdesc='Pantheon Lite Session (pantheon/openbox desktop environment)'
arch=('i686' 'x86_64')
url='https://bbs.archlinux.org/viewtopic.php?pid=1402016#p1402016'
license=('GPL3')
depends=('openbox' 'obconf' 'compton' 'pantheon-workarounds' 
         gnome-{settings-daemon{,-compat},session}
         {plank,cerbere,slingshot-launcher}-bzr)
[[ -n "$(pacman -Qq super-wingpanel-unstable-bzr 2>/dev/null)" ]] && \
  depends+=('super-wingpanel-unstable-bzr') || \
  depends+=('wingpanel-bzr')
optdepends=(indicator-{application,datetime,messages,printers,session,sound}-pantheon-bzr": Tray applet"
            "indicator-power-bzr: Tray applet"
            "network-manager-applet-ubuntu: Tray applet"
            "glippy-bzr: Simple, powerful clipboard manager"
            "indicator-powersave: On the fly power savings and performance toggles"
            "pantheon-notify-bzr: Popup notifications (freedesktop standard compliant)"
            "pantheon-print-bzr: Printer dialog (integrates with contractor-enabled applications)"
            "elementary-os-openbox: Elementary theme for Openbox")
provides=("pantheon-lite")
conflicts=()
source=(pantheon-openbox.{desktop,session} 
        compton-{dbus.desktop,inverter} 
        obsession{,.desktop}
        openbox-qq-rc.xml)
sha512sums=('6c48a8b49efe2df87b7bdc4e4c315c788270eb5c3cba4fd14493f389257e9d307268834d7c35945ff45654c248e0c874f01f80d78fa4c8a9b52aa23b20896273'
            'b9ceef659e68d63084477ba0c5b9b494b6351bee450ae3cac4f210fbab13036bb679e05486d17ac80a646c856cc29c3cc8604b7b3b031b08c02c50d20efd3177'
            '0917b70b9811e8f4a61a5f962f9103c378385d58f2b5b62c770ed0d3f75874aa0678be468270c370248f5e24279208c38fabbff704da1ed9b67c07d8cb0becc2'
            '8696b95b4f6b37c9edddcdbef95300d0651d56b12cf1238204874aa625a37c84a30b324b08bdfbe67735785eea2c448e09ad3e2028c0f6058b02b7d4cf665e7c'
            '2cacd7bd7b5c9d019f5650a507f94b57f8b61494e27ceb423a23c1e654c135eb2b33a3bd7d8ec3cbdbb81ec9969b4776e853bf12ddf7390842c34f856c42c6ef'
            'c70588c4d844c8916a97c61fae40dab2a38527fa0d31c7261700766f2e784d642edccb1a64544b9dfdc0655dd5a6b872e9bf323029091656ae45b0924d15ea0e'
            '581ebce75d6b7915d586ae0b34fd4ed4620c3f3dd0ab5d3e8516f03d286a09d0b66141193a8178845c853dbb86d986de906555598133210ba946e4dd54eba60e')

package() {
  install -Dm655 {,"${pkgdir}"/usr/share/xsessions/}pantheon-openbox.desktop
  install -Dm655 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-openbox.session
  install -Dm655 {,"${pkgdir}"/usr/share/applications/}compton-dbus.desktop
  install -Dm655 {,"${pkgdir}"/usr/bin/}compton-inverter
  install -Dm655 {,"${pkgdir}"/usr/bin/}obsession
  install -Dm655 {,"${pkgdir}"/usr/share/applications/}obsession.desktop
}

