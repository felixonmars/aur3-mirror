# Contributor christopher luna archlinux at christopher dash luna d0t com
# Background created by cimple

pkgname=slim-theme-arch-carbon
pkgver=0
pkgrel=1
pkgdesc="A dark gray scale theme for slim with the arch logo"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=129751"
license=('unknow')
depends=(slim)
makedepends=()
options=()
provides=()
conflicts=()
groups=('wallpaper')
source=(http://www.imgbox.de/users/public/images/9JTuaxcpav.png
http://www.imgbox.de/users/public/images/Tz2ANuWpg3.png
slim.theme
)
md5sums=('3e885fb5671efa9bceecf06be53082c3'
         '226246cb64358b4f334c25d17928a29a'
			'5c0ac874d12af9c9f9a72d79e5ab543f')

build() {
			install -d ${pkgdir}/usr/share/slim/themes/arch-carbon/
			install -D -m644  9JTuaxcpav.png ${pkgdir}/usr/share/slim/themes/arch-carbon/background.png
			install -D -m644  Tz2ANuWpg3.png ${pkgdir}/usr/share/slim/themes/arch-carbon/panel.png
			install -D -m644  slim.theme ${pkgdir}/usr/share/slim/themes/arch-carbon/slim.theme
}
