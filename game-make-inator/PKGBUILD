# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=game-make-inator
pkgver=13.05
pkgrel=1
pkgdesc="Game-Make-inator: A graphical video game editor"
arch=(i686 x86_64)
url=http://lunduke.com/?page_id=3152
license=(custom:GLL)
depends=(desktop-file-utils gtk2)
[[ $CARCH == "x86_64" ]] && depends[1]=lib32-gtk2
replaces=(blaba)
install=$pkgname.install
source=(http://www.lunduke.com/dl/gmi-13.05-linux32bit.tar.gz
    LICENSE
    $pkgname.desktop
    $pkgname.png)
sha256sums=('95fed8cb18e528e5368fc95c08d9d1e4e1a7678f5a9f9969078b4ea1b61d2433'
    '72f4a64010d31d601c2780344b52c87ce08d5c604e1d58255578cd9cc3c8fc5a'
    '556792fb4ea24638dd00475efd979cbbcd7918d15fa4a2bdfe360a8de1b527cf'
    'b89d0c18cfb6a116f2c95a2326c7ce9e42b7169d9361add5260534ad3ba7edcd')
sha512sums=('8bb831f18773b5822d3332e9a549cd0d0cd72e3bb4e10b53beb0c169c6725f56ee7f014d53c9fb1d19640a4cca506e359cd02254e48ad600d84c7eb2db167bfa'
    'beba5402b92dd9e756a1afd4b5d2cbcb8b70b110bb0db5b1ca2bc24a010f4ade92bfdca8ef548cfbc52a17b565010421bb793410366c4c41fd0127fc0d6dec90'
    '2e9c103faf8f6514a311b77ba8663e4047eb24899ce8bab325ef1cf4ed40915b53c23c4131e91436ffd3e9c50b411b66915033864276580b0b4579b6aa2924b1'
    'ef0dc0d070dc6a0eb3c37052b4bda82b42aefb1950d64ea9685de44dc10762a35021f4f5993c92d0670d134f99d3c5bba662f6eebebd55bbd99c38a2893b0c4a')

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    rm -rf gmi/sup/{mac,windows}
    install -d "$pkgdir"/opt/
    cp -r gmi/ "$pkgdir"/opt/$pkgname

    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/

    install -d "$pkgdir"/usr/{bin,share/pixmaps}/
    ln -s /opt/$pkgname/gmi.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    ln -s /opt/$pkgname/gamemake "$pkgdir"/usr/bin/gamemake
}
