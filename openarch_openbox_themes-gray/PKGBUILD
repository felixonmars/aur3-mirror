# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_openbox_themes-gray
pkgver=0.2
pkgrel=1
pkgdesc="Openbox themes for OpenArch"
arch=('any')
groups=('openarch_gray')
url="http://box-look.org/"
license=('GPL')
depends=('openbox-themes')
source=('shiki-statler.tar.gz')


build() {
	cd "${srsdir}"
	for a in *.tar.gz; do
	  tar -xf "${a}" -C "${pkgdir}"/
	done
}

md5sums=('35bee568e41f175edae048e4eccc0182')
