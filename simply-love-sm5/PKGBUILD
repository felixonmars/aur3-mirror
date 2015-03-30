# Maintainer: Nathan Chowning <nathan@chowning.me>

pkgname=simply-love-sm5
pkgver=1.1
pkgrel=1
pkgdesc="dguzek's recreation of hurtpiggypig's Simply Love SM3.95 theme made to now run in StepMania 5"
url="https://github.com/nchowning/Simply-Love-SM5"
arch=("any")
license=("No License")
depends=('stepmania>=5')
source=(https://github.com/nchowning/Simply-Love-SM5/archive/v${pkgver}.tar.gz)
sha256sums=("938d4db524a0fd5201e6fcd2d53653dde1f67bb2c11e2679bb4df244e0c9eba4")

package() {
    cd "$srcdir"
    install -d "$pkgdir/opt/stepmania/Themes"
    cp -r "Simply-Love-SM5-${pkgver}" "${pkgdir}/opt/stepmania/Themes/Simply-Love-SM5"
}
