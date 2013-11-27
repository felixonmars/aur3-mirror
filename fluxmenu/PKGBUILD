# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>

pkgname=fluxmenu
pkgver=24
pkgrel=3
pkgdesc="A graphical (pyGTK) menu editor for FluxBox window manager"
arch=(any)
url=http://fluxmenu.berlios.de/
license=('GPL')
depends=(libglade pygtk)
source=(http://download.berlios.de/fluxmenu/fluxMenu-$pkgver.tar.gz
    handle-menu.patch)
sha256sums=('aa76cd3670c963fdbb7698e7cae325550e42d0c36d9a6b477cdbc6cb40eb2a4d'
    '41c8b0480aa39c06d15e9188d2f926eadaa1d8541530ad7d372ee480d9ba5c2c')
sha512sums=('58f8587bfa76729055f585072cba85ee2328b2c1d667bd5bf93187b98572013b675df8e256141146fb6bffd99a1ffa7dfb90f4be89365803a6a75f026f604993'
    '81b74d6c53d3c799f55e871d6cacff84c785d263fc8df4579d3e23dc49570111bba352b6dd27e45a7a054c57dc53f26d8c5f803efffef1b64fd17b5f34d3d50d')

prepare() {
    cd $pkgname/
    patch -p1 -i ../handle-menu.patch
}

package() {
    cd $pkgname/
    sed -i 's:^#!/usr/bin/env python$:&2:' fluxMenu.py
    install -Dm644 pixmaps/mini-fluxbox5.png "$pkgdir"/usr/lib/$pkgname/pixmaps/mini-fluxbox5.png
    for i in {findIcons,fluxMenu,handleMenu}.py project1.glade{,p}; do
        install -m755 $i "$pkgdir"/usr/lib/$pkgname/$i
    done

    install -d "$pkgdir"/usr/bin/
    ln -s /usr/lib/$pkgname/fluxMenu.py "$pkgdir"/usr/bin/$pkgname
    for i in project1.glade{,p}
    do
        ln -s /usr/lib/$pkgname/$i "$pkgdir"/usr/bin/$i
    done
}
