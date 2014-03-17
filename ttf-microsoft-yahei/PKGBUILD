# Maintainer: Limao Luo <luolimao@gmail.com>
# Contributor: dongfengweixiao <dongfengweixiao@gmail.com>

pkgname=ttf-microsoft-yahei
pkgver=6.14
pkgrel=1
pkgdesc="Microsoft Yahei fonts (regular, bold, and light styles)"
arch=(any)
url=http://www.microsoft.com/typography/fonts/family.aspx?FID=350
license=(unknown)
depends=(fontconfig)
install=$pkgname.install
source=(http://dl.dropbox.com/u/3395784/aur/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('b6b5ebb66e03a2ab558f9b0632e88eec5cf8570c26837800d01a8c20ad3668ad')
sha512sums=('b45f61772d29d56b4c02086df5f643b9ee9da196a165e017a3561aeee45c84158d839baa07400faefc0a52ee964eeaa303c3946c3d6f6df3d62839a7ae08c85c')

package() {
    for f in msyh{,bd,l}; do
        install -Dm644 $f.ttc "$pkgdir"/usr/share/fonts/microsoft/$f.ttc
    done
}
