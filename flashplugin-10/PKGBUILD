# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Xavion <Xavion0@gmail.com>
# Contributor: Michael Witten <mfwitten>

_langname=flash
_appname=${_langname}player
_basename=${_langname}plugin
pkgname=$_basename-10
pkgver=10.3.183.90
pkgrel=1
pkgdesc="Adobe Flash Player v10 (32-bit) - with GPU hardware acceleration"
arch=(i686 x86_64)
url=http://www.adobe.com/products/flashruntimes.html
license=(custom)
depends=(hicolor-icon-theme lib32-alsa-lib lib32-curl lib32-gtk2 lib32-libxt lib32-nss mozilla-common)
optdepends=('lib32-libvdpau: video hardware decoding for supporting players'
    'nspluginwrapper: make this plugin work with 64-bit browsers'
    'firefox32: 32-bit Firefox for 64-bit systems')
if [[ $CARCH == "i686" ]]; then
    depends=(${depends[@]/lib32-/})
    optdepends=('libvdpau: video hardware decoding for supporting players')
fi
provides=($_basename=$pkgver)
conflicts=($_basename)
options=(!strip)
install=$pkgname.install
backup=(etc/adobe/mms.cfg)
source=(http://download.macromedia.com/pub/flashplayer/installers/archive/fp_${pkgver}_archive.zip
    mms.cfg)
sha256sums=('28ad25861caecfb4e48600c900f0a8808f866eb2abddbb3053913a8bc7abdbbc'
    '27dad99feecfd7152305bd86e8149e8c6482b7dc787ccd205c05d1dc13aafead')
sha512sums=('e287557429282c969beb282bcf3c92e0a03867d8682edb30256c86d09258ee551ced5b336ac0a60d169d6290c219d49b11861c7120d258b85d6e9d890bfb6f67'
    'a5e273179d026c9f0c8609a8076cc5c129faf21dd605899b7904e53c2bdf899de94c7e258c2b0ac381a38b68675bdd381a47d1bfbf8ebcd6f10e6a4c8ac9207a')

package() {
    install -Dm644 mms.cfg "$pkgdir"/etc/adobe/mms.cfg
    mv usr/bin/flash-player-properties{,-10}
    cp -r usr/ "$pkgdir"/usr
    install -Dm755 lib$_appname.so "$pkgdir"/usr/lib/mozilla/plugins/lib$_appname.so
}
