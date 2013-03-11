# Maintainer: Limao Luo <luolimao@gmail.com>
# Contributor: dongfengweixiao <dongfengweixiao@gmail.com>

pkgname=ttf-microsoft-tahoma
pkgver=5.26
pkgrel=1
pkgdesc="One of Microsoft's new sans serif typeface families."
arch=(any)
url=http://www.microsoft.com/typography/fonts/family.aspx?FID=19
license=(unknown)
depends=(fontconfig)
install=$pkgname.install
source=(http://dl.dropbox.com/u/3395784/aur/$pkgname/$pkgname.tar.xz)
sha256sums=('ac9608e73c7d539a11ed612885d23a2ff710a14a645ab3b91853b6def4073ae3')
sha512sums=('4ef4b8fa81286d810f1ebe0b2e6f29ccf0714418a21e1d954d1f44cdc2b70f1bd4865b3f7488eed8a9174ba512a363dddc560f02bf3384b5654f6e73b3a421c5')

package() {
    for f in tahoma{,bd}; do
        install -Dm644 $pkgname/$f.ttf "$pkgdir"/usr/share/fonts/microsoft/$f.ttf
    done
}
