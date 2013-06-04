# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=2299thegame
pkgver=1.0.5
pkgrel=1
pkgdesc="An old-school, point and click adventure game with 8-bit inspired, retro graphics."
arch=(i686 x86_64)
url=http://lunduke.com/?page_id=2333
license=(custom:GLL)
depends=(desktop-file-utils lib32-cairo1.10 lib32-gtk2)
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
install=$pkgname.install
source=(http://www.lunduke.com/dl/2299-ep1-linux.tar.gz
    $pkgname.desktop
    LICENSE)
sha256sums=('a08c3dc4e5305177f7e4e20ce5745e31e096636f6ec870249f2d32b9c966dff6'
    'aa52303f96150fd4b3263857dacb7745da2f6e8cbf09024fe25c65bbe5d6156e'
    '72f4a64010d31d601c2780344b52c87ce08d5c604e1d58255578cd9cc3c8fc5a')
sha512sums=('d6d281de45e9cc10e027eb35884515d26225267da05afb301aa43b35d9f4582b3961206906f112a0ec3eb3a34a9803070343158cc975b1679287367d6f0c2965'
    'ad0bfd691e2f93893a8a3dd4dc31d3675bdbd87ec238e6b7b91b1ae934b80bef3e2ca61616949090c93bae1a64c2f269e13c6991d67ea6dd1524309742e1b11d'
    'beba5402b92dd9e756a1afd4b5d2cbcb8b70b110bb0db5b1ca2bc24a010f4ade92bfdca8ef548cfbc52a17b565010421bb793410366c4c41fd0127fc0d6dec90')

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    cd $pkgname/
    install -Dm755 2299 "$pkgdir"/usr/bin/$pkgname
    install -Dm644 2299.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
