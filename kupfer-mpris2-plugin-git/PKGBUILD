# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=kupfer-mpris2-plugin-git
pkgver=16.f65a714
pkgrel=1
pkgdesc="Control mpris compatable media players from Kupfer"
arch=(any)
url=https://github.com/hugosenari/Kupfer-Plugins
license=('GPL')
depends=(kupfer mpris2-git)
makedepends=(git)
source=($pkgname::git://github.com/hugosenari/Kupfer-Plugins.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d "$pkgdir"/usr/share/kupfer/kupfer/
    cp -r $pkgname/mpris2-player/ "$pkgdir"/usr/share/kupfer/kupfer/plugin/
}
