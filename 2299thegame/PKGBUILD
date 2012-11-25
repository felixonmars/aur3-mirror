# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=2299thegame
pkgver=1.0
pkgrel=2
pkgdesc='An old-school, point and click adventure game with 8-bit inspired, retro graphics.'
arch=(i686 x86_64)
url="http://lunduke.com/?page_id=2333"
license=(custom:GLL)
depends=(desktop-file-utils gtk2)
[[ $CARCH == "x86_64" ]] && depends[1]=lib32-gtk2
install=$pkgname.install
source=(http://www.lunduke.com/2299thegame/2299thegame.tar.gz
    $pkgname.desktop
    LICENSE)
sha256sums=('40bf50bd6385b6ae38844ad31c7475bd2dd50d5062faeb7bb9f3a65e9ff6a46f'
    'aa52303f96150fd4b3263857dacb7745da2f6e8cbf09024fe25c65bbe5d6156e'
    '72f4a64010d31d601c2780344b52c87ce08d5c604e1d58255578cd9cc3c8fc5a')
sha512sums=('2893a3ce01b719ce316965bc970945be2f58bab1778dda27f303ed3b1fb8652c447f80776ad176fffd1fd00179709e2102794ac01bd6c95a533758466438dd00'
    'ad0bfd691e2f93893a8a3dd4dc31d3675bdbd87ec238e6b7b91b1ae934b80bef3e2ca61616949090c93bae1a64c2f269e13c6991d67ea6dd1524309742e1b11d'
    'beba5402b92dd9e756a1afd4b5d2cbcb8b70b110bb0db5b1ca2bc24a010f4ade92bfdca8ef548cfbc52a17b565010421bb793410366c4c41fd0127fc0d6dec90')

package() {
    cd "$srcdir"/$pkgname/
    install -Dm755 2299 "$pkgdir"/usr/bin/$pkgname
    install -Dm644 2299.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    desktop-file-install ../$pkgname.desktop --dir "$pkgdir"/usr/share/applications/
}
