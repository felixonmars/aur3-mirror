pkgname="plymouth-theme-arch-logo-gnomish"
pkgver=0.1
pkgrel=2
pkgdesc="Arch Linux theme with GNOME touch"
arch=('any')
url="http://aur.archlinux.org/packages/plymouth-theme-arch-logo-new/"
license=('GPL')
depends=('plymouth')
options=('')
install='plymouth-arch-logo-gnomish.install'
source=("plymouth-arch-logo-gnomish.tar.gz"
	"plymouth-arch-logo-gnomish.install")

package() {
    cd $srcdir/arch-logo-gnomish
    mkdir -p $pkgdir/usr/share/plymouth/themes/arch-logo-gnomish
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/arch-logo-gnomish
}
md5sums=('4c84ce5dd2e57a5cc68226f9a887ce8e'
	 '8e7ab45e9ddf60b4225a1e927128a159')
