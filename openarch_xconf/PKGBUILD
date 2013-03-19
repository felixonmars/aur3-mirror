# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_xconf
pkgver=0.7.5
pkgrel=8
pkgdesc="Hardware configure cripts"
arch=('any')
groups=('openarch_scripts')
url="http://ovsinc.narod.ru/"
license=('GPL')
depends=('alsa-utils' 'xorg-server' 'initscripts' 'dmidecode' 'systemd')
optdepend=('kbd' 'consolekit')
source=("http://dl.dropbox.com/u/19256622/src/$pkgname/xarch_conf.tar.gz")

build() {
	cd "${srcdir}"
	cp -R "${srcdir}"/xarch_conf/* "${pkgdir}"/
}
md5sums=('54d6ac8a3cb57dffd466f3be4f019d0f')
