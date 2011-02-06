# Contributor: Maciej Ciemborowicz <moonkey[at]op[dot]pl>

pkgname=clam-smstools
pkgver=0.4.10
pkgrel=2
pkgdesc="an audio authoring tool using the Sinusoidal Model Synthesis (SMS) representation"
url="http://clam-project.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('clam>=1.3.0')
makedepends=('scons')
source=(http://clam-project.org/download/src/SMSTools-${pkgver}.tar.gz)
md5sums=('960d740eb08540259bb8eabe521c9dcf')

build() {
	cd ${srcdir}/SMSTools-${pkgver}
	scons prefix=/usr clam_prefix=/usr DESTDIR=$startdir/pkg install || return 1
}


