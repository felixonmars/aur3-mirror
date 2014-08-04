# Maintainer:  Xiaoxiao Pu <i@patme.net>
# Contributor: Jianjun Mao <justmao945@gmail.com>

pkgname=xcursor-oxy-neon
pkgver=0.2
pkgrel=1
pkgdesc="Stylized oxygen mouse theme created for use with dark desktop and especially for FRUiT's Neon suite."
arch=('any')
url="http://gnome-look.org/content/show.php/Oxygen+Neon?content=137109"
license=('GPL')
source=("http://gnome-look.org/CONTENT/content-files/137109-oxy-neon-0.2.tar.gz")
sha256sums=('4ef320165c749d1f9953e852eb69d74f0bf3eb9bab728dc230fb7565570d5655')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/icons/"
	cp -r "${srcdir}/oxy-neon" "${pkgdir}/usr/share/icons/"
}