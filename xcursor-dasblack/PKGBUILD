# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=xcursor-dasblack
pkgver=1.0
pkgrel=1
pkgdesc="A cursor theme"
arch=(any)
url=http://gnome-look.org/content/show.php/DasBlack?content=106216
license=('GPL')
source=($pkgname.tar.gz::http://gnome-look.org/CONTENT/content-files/106216-DasBlack.tar.gz)
noextract=($pkgname.tar.gz)
sha256sums=('70fdbbe01a5f06a1ce2195c763a415aedc45bcf0ecdccbe7038c66111cafbd52')
sha512sums=('cc1097aeda6d7e77ed24bf1ff7f49e0bfc6983bd22d18f398cc9b07aa6a4c750f864a7e437a7516af098aac01bb0293edd2b136117e4210d30be835b9ba8d153')

package() {
    install -d "$pkgdir"/usr/share/icons/
    bsdtar -xf $pkgname.tar.gz -C "$pkgdir"/usr/share/icons/
    chown -R root:root "$pkgdir"
}
