# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: dongfengweixiao <dongfengweixiao@gmail.com

pkgname=ttf-microsoft-jhenghei
pkgver=6.02
pkgrel=2
pkgdesc="Distributed with Windows Vista as default interface font. Designed by China Type Design Limited.Microsoft JhengHei include Regular and Bold style."
arch=(any)
url=http://www.microsoft.com/typography/fonts/family.aspx?FID=368
license=(unknown)
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(http://gthemes-china.googlecode.com/files/jhenghei.tar.gz)
sha256sums=('4587d478d9b19aefac432c06a93249923a86906161731661956af641fd6de93b')
sha512sums=('74560a89161c170f9b0090c2791576a8d0d0ae7fd72cf5ba097e9538812c88d8a17fa96b77b59aa0af3c4a4be959979b580824a24b7499cf59bcbb4c368557ac')

package() {
    for f in msjh{,bd}.ttf
    do
        install -Dm644 $f "$pkgdir"/usr/share/fonts/microsoft/$f
    done
}
