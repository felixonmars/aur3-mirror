# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: snostorm <snostormjp@gmail.com>

_pkgname=illumination
pkgname=$_pkgname-software-creator
pkgver=6.1.0
pkgrel=1
pkgdesc="Illumination Software Creator: Graphical programming environment that generates source code for various targets (including ActionScript/Adobe Flex, Android, HTML/JS, and Python/GTK)"
arch=(i686 x86_64)
url=http://lunduke.com/?page_id=3454
license=(custom:GLL1.0)
depends=(desktop-file-utils gtk2)
optdepends=('pygtk: Needed for Python/GTK target'
    'eclipse-android: Needed for Android target'
    'android-sdk: Needed for Android target'
    'adobe-air-sdk: Needed for building Adobe Air/flex targets')
if [[ $CARCH == "x86_64" ]]; then
    depends[1]=lib32-gtk2
    optdepends+=('lib32-libcanberra: To get rid of an annoying error'
        'lib32-gtk-engines: Needed to get a decent look & feel')
fi
provides=($_pkgname)
install=$_pkgname.install
source=(http://www.radicalbreeze.com/dl/illumination-linux.tar.gz
    LICENSE
    http://dl.dropbox.com/u/3395784/aur/$pkgname/$pkgname.png
    $_pkgname.desktop)
sha256sums=('1175fe64190d0919bad4fb5846fb5348af0bd460a7b2c748360f40eab0fceada'
    '24e871401a40093c5c4d36e07e7275a706bfa3129c606e4cab45f0a98e0c3286'
    'e97606f3482f0d4110aa8333c52faa7a77e417aff4f17ec87c149f96b7924e7e'
    '476cc13ed5d1250dca40a9ca1513c11684a9c85d74d11cdaadd762554e53258a')
sha512sums=('ae09d46bacc90eefde6737c66f315208149c4b23d513fbff2101af52380225d4eaf857eeeb985c91e5280df20afe416a6fd42e05e63d24db58172f307875cb4c'
    'e6fd9d67e589cf6ef714c2811b51af6cd1ac6c193b5a18e6fff27814d3d84bdec62cbbfe16746c890d79d7e41f5fe73762720068c4ea0ee5123a35b4fb19594d'
    '606649a56c5d747b6b32e5a3389341183bee86fe34aa935ada0d40726413995b297ad8194ce8cee83c4290f0c8b040a5dfa9e80e9914f1ae5ec692d753a5e06d'
    '9c2442390a654e4aa7c396b7c5ae3f2a676f641a47dbae873dc0af880fbfe436e46cfd539e542a91edcccf13bf6b28acf63ff34220765e4c447d8a4a719a750f')

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
    desktop-file-install $_pkgname.desktop --dir "$pkgdir"/usr/share/applications/

    install -d "$pkgdir"/opt/
    cp -r $_pkgname/ "$pkgdir"/opt/$pkgname

    install -d "$pkgdir"/usr/bin/
    ln -s /opt/$pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
