# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

_pkgname=radical
pkgname=$_pkgname-comic-designer
pkgver=3.1
pkgrel=1
pkgdesc="Radical Comic Designer: A graphical comic designer"
arch=(i686 x86_64)
url=http://lunduke.com/?page_id=3012
license=(custom:GLL)
depends=(desktop-file-utils gtk2)
[[ $CARCH == "x86_64" ]] && depends[1]=lib32-gtk2
install=$_pkgname.install
source=(http://www.lunduke.com/dl/rcd-3-linux.tar.gz
    LICENSE
    $_pkgname.desktop)
sha256sums=('dfaca7881d30bb7a545bf375c9a2ad4d63f985a4e62da13fe07b8b2ce9a4700a'
    '72f4a64010d31d601c2780344b52c87ce08d5c604e1d58255578cd9cc3c8fc5a'
    '17ca0607726da7673417ac695c22e011a6f2a05d3486884c47d8abe3587e89bc')
sha512sums=('c0e74f57dafb60117b5cebd1d532f8d9a0a01d4b59a40fd47182276f440720354498ba54359f1a327c26343303226d4e99d5370c4fb16c9f3b5b836d1fdf0f67'
    'beba5402b92dd9e756a1afd4b5d2cbcb8b70b110bb0db5b1ca2bc24a010f4ade92bfdca8ef548cfbc52a17b565010421bb793410366c4c41fd0127fc0d6dec90'
    '35d9f31bf137634eb3705036fcbc09ce17e00a325d3935b0a545f333d8f204469328de2b18d4d95a2fc0906a53e5188470c01ac4c439764e92b2a2a437739c7a')

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    pushd RadicalComicDesigner/
    install -Dm644 RCDIcon256.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png; rm RCDIcon256.png
    popd

    install -d "$pkgdir"/opt/
    cp -r RadicalComicDesigner/ "$pkgdir"/opt/$pkgname

    desktop-file-install $_pkgname.desktop --dir "$pkgdir"/usr/share/applications/

    install -d "$pkgdir"/usr/bin/
    ln -s /opt/$pkgname/RadicalComicDesigner "$pkgdir"/usr/bin/$_pkgname
}
