# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_openbox_themes
pkgver=0.1
pkgrel=1
pkgdesc="Openbox themes for OpenArch"
arch=('any')
url="http://box-look.org/"
license=('GPL')
depends=('openbox')
source=('carbone.tar.gz' 'curdled.tar.gz'
		'loma.tar.gz' 'murrina-tangoesque.tar.gz')

md5sums=('59408650e756d343a1b99b1580aa8d89'
         '9b3414756f1b8c8fedf45b76d4a307d8'
         '274b27f60e9e691a35ccb8619ae24693'
         'bd44382fbb40740000cc2806c4549794')

build() {
	cd "${srsdir}"
	for a in *.tar.gz; do
	  tar -xf "${a}" -C "${pkgdir}"/
	done
}
