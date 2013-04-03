# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=xcursor-bw3d
pkgver=1.0
pkgrel=1
pkgdesc="cursor theme"
arch=(any)
url=http://gnome-look.org/content/show.php/BW3D?content=105097
license=('GPL')
source=(http://www.deviantart.com/download/178413200/bw3d_by_grynays-d2y80i8.zip)
sha256sums=('1e3aa7a0346591e5ace8ce1bfe64e42032caef042cad7ef7ce488f6f007aefe0')
sha512sums=('e190f7f63211bb91bb45f41551544581fd3e49b309cdefed8fdb003b26cde283fea96b48897db5c4ff298c1bcb66b663efeb5a424733b1dc954721b8eb16e125')

package() {
    install -d "$pkgdir"/usr/share/icons/
    bsdtar -xf BW3D.tar.gz -C "$pkgdir"/usr/share/icons/
    chown -R root:root "$pkgdir"
}
