# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ttf-scada
pkgver=20131123
pkgrel=1
pkgdesc="A free public font Scada"
arch=(any)
url=http://www.scada.lv/company/scada-font/
license=('custom:OFL')
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(http://dl.dropbox.com/u/3395784/aur/$pkgname/$pkgname.tar.xz
    http://www.scada.lv/files/OFL.txt)
sha256sums=('8a7c7c2a58f89cdaf95cce996b6494986d771cd74dac779cd6876b9a928f7cab'
    '0a75a3e587afeb50fd4d8c5fdd2c4fa4a0fea7affc7df6e87e66192fbc97bcee')
sha512sums=('8ba827b50e837fa4c8c15bdb25a43c7e9cd0eae8b7fb1eb1d1087ff03e3517d5136692dba0f44c10b886971584f7c69966bfe514e98fda40f01217be3101a558'
    '23c98245f5de88ffe01a35d646d727ecfd2842831304592bd2abbb18d8b805f6a0e48d7990c8cc0fa9ff4c53ab17150014ea08c6dd4d8f81c4c624f6093110f7')

package(){
    install -d "$pkgdir"/usr/share/fonts/TTF/
    install -m644 Scada-*.ttf "$pkgdir"/usr/share/fonts/TTF/

    install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
