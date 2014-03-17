# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: dongfengweixiao <dongfengweixiao@gmail.com>

pkgname=ttf-microsoft-wingding
pkgver=5.00
pkgrel=1
pkgdesc="Was designed by Kris Holmes and Charles Bigelow in 1990 and 1991. The fonts were originally named Lucida Icons, Arrows, and Stars to complement the Lucida text font family by the same designers."
arch=(any)
url=http://www.microsoft.com/typography/fonts/family.aspx?FID=16
license=(unknown)
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=(http://dl.dropbox.com/u/3395784/aur/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('e1d050d0227b987039922acc861b5035f69c88ccfdae7fe061195b9b9adbb9d3')
sha512sums=('ad181be64a1de9709252474760170b1c7f71ec26b33a9e791735833988f40e930e5ccbe0cfe7136c36d7c407081ea93ce957472302a9db678d1a8bee07749ca2')

package() {
    for f in wingding.ttf WINGDNG{2,3}.TTF; do
        install -Dm644 $f "$pkgdir"/usr/share/fonts/microsoft/$f
    done
}
