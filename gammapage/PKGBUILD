# Contributer: N30N <archlinux@alunamation.com>
# Contributer: Franek <carlos_franke@taunusstein.net>
# Contributer: kfgz <kfgz@interia.pl>

pkgname="gammapage"
pkgver=0.5.1
pkgrel=1
pkgdesc="A gamma-adjusting utility for monitor calibration"
url="http://www.pcbypaul.com/software/GAMMApage.html"
license=("GPL2")
arch=("any")
depends=("pygtk" "pango")
makedepends=("python2-distribute")
# source=("http://www.pcbypaul.com/software/dl/${pkgname}-${pkgver}.tar.gz")
source=("http://ftp.frugalware.org/pub/frugalware/frugalware-current/source/xapps-extra/gammapage/${pkgname}-${pkgver}.tar.gz")
md5sums=("7371728c2f314139196b61321c834022")
sha256sums=("edaa082eda3b389d5207ef0a1482c3479c59583b9fc9a1ecd7aa8172409111e7")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}

# vim: set noet ff=unix:
