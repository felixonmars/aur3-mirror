# Maintainer: Capi Etheriel <barraponto@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Marek Otahal <markotahal@gmail.com>
# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=revengeofthetitans-hib
pkgver=1.80.20
pkgrel=1
pkgdesc="Construct and command your ground defences in a series of increasingly massive battles across the solar system, in a frenetic arcade mash-up of Real Time Strategy and Tower Defense!"
arch=(i686 x86_64)
url=http://www.puppygames.net/revenge-of-the-titans/
license=(custom)
depends=(java-runtime lib32-gtk2 openal)
provides=('revengeofthetitans')
[[ $CARCH = "i686" ]] && depends=(${depends[@]/lib32-/})
install=$pkgname.install

[[ $CARCH == "i686" ]] && _arch=i386 || _arch=amd64
_gamepkg="RevengeOfTheTitans-HIB-${pkgver//./}-$_arch.tar.gz"

PKGEXT=.pkg.tar
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("$_gamepkg::hib://$_gamepkg" "revenge.desktop")
sha256sums=('589af01642ef6c3f5d1f1304cde4261dfb80664125ea24d18c8f46db55d75a49' '63a8df5193aeeb4a633fbb4e793fd279d3c0753b77f462e876942af348b02700')
sha512sums=('84f9764ee828e7f974beb3a81320ef85d5936de483018c87e44627a91260118a03a5b6b9ccc5e74bc403365a5f3cd9ac826e985fce129b8648e9260c1301af82' '8377074fc081864a52e99ff1f7703b0ebbe9cda6bb5fd258fb1c196f832f05f929744e626743f12a2a4a29bea3ea646ce61b940fd00b893ce6afe5bf02025eea')

build() {
    pkgpath="$startdir"
    bsdtar -xf "$pkgpath/${_gamepkg}"
    sed -ri "s|^(INSTDIR=\")[^\"]+|\1/opt/rott/|" "$provides/revenge.sh"
}

package() {
    desktop-file-install revenge.desktop --dir "$pkgdir"/usr/share/applications/
    cd "$provides/"
    install -Dm755 revenge.sh "$pkgdir"/usr/bin/revenge
    install -d "$pkgdir"/opt/rott
    install -m755 *.so "$pkgdir"/opt/rott/
    install -m644 *.{jar,png} "$pkgdir"/opt/rott/
    install -Dm644 "$pkgdir"/opt/rott/revenge.png "$pkgdir"/usr/share/pixmaps/revenge.png
}
