# Maintainer: Limao Luo <luolimao@gmail.com>
# Contributor: dongfengweixiao <dongfengweixiao@gmail.com>

pkgname=ttf-microsoft-consolas
pkgver=5.33
pkgrel=1
pkgdesc="Microsoft font aimed for use in programming environments and other circumstances where a monospaced font is needed."
arch=(any)
url=http://www.microsoft.com/typography/fonts/family.aspx?FID=300
license=(unknown)
depends=(fontconfig)
install=$pkgname.install
source=(http://dl.dropbox.com/u/3395784/aur/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('2520ac8579ffbbfd0196f27f239af23a24ffdb671a56df7013852630f9aebeb6')
sha512sums=('2da7b9c0672da640aaaf60a05fef395e2c30a5a2f5c29d9179b69f653af74c018752a2c8412ce174f6b3f6fb43380fa1e31710de0324eee388df69b166372bf0')

package() {
    for f in consola{,b,i,z}; do
        install -Dm644 $f.ttf "$pkgdir"/usr/share/fonts/microsoft/$f.ttf
    done
}
