# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=nwn-original-fr
pkgver=1.69
pkgrel=1
pkgdesc="Neverwinter Nights RPG from BioWare (original game French localization)"
arch=("any")
license=("custom")
depends=("nwn-original-resources=$pkgver")
url="http://nwn.bioware.com/downloads/linuxclient.html"
provides=("nwn-original-l10n")
conflics=("nwn-original-l10n")
source=("http://files.bioware.com/neverwinternights/updates/linux/nwfrench129.tar.gz"
        "NWN169FR.zip::http://nwvault.ign.com/fms/Download.php?id=134731")
md5sums=('d1e72a42a20c247332de6c6adcbcade5'
         'ab84b186938ca5c866e651341d0f9b48')

package() {
  cd "${srcdir}"
  install -Dm644 dialog.tlk "${pkgdir}/opt/nwn/original-l10n/dialog.tlk"
  install -Dm644 dialogf.tlk "${pkgdir}/opt/nwn/original-l10n/dialogf.tlk"
  install -Dm644 chitin.key "${pkgdir}/opt/nwn/original-l10n/chitin.key"
  install -Dm644 data/voicesets.bif "${pkgdir}/opt/nwn/original-l10n/data/voicesets.bif"
  install -Dm644 data/convo.bif "${pkgdir}/opt/nwn/original-l10n/data/convo.bif"
  install -Dm644 data/fr_voicesets.bif "${pkgdir}/opt/nwn/original-l10n/data/fr_voicesets.bif"
  install -Dm644 data/fr_convo.bif "${pkgdir}/opt/nwn/original-l10n/data/fr_convo.bif"
}

