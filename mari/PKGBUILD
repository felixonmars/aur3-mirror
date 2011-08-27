# Contributer: N30N <archlinux@alunamation.com>

pkgname="mari"
pkgver=1.0v1
pkgrel=1
pkgdesc="A creative texture-painting tool that can handle extreme projects."
url="http://www.thefoundry.co.uk/products/mari/"
license=("custom")
arch=("x86_64")
depends=()
makedepends=()
source=("http://thefoundry.s3.amazonaws.com/products/mari/releases/${pkgver}/Mari${pkgver}-linux-x86-release-64.tgz")
md5sums=("e652d6b359c1b49c7d0a9a453114f04a")

# License must be placed in /usr/local/foundry/FLEXlm/foundry.lic

build() {
	cd ${srcdir}/Mari${pkgver}
	sed "s|\(presentScriptPath=\).*|\1/opt/${pkgname}|" -i mari
	install -D -m755 mari ${pkgdir}/usr/bin/mari
	install -D -m644 EULA.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -d ${pkgdir}/opt/${pkgname}
	cp -r 3rdParty bin lib Media plugins ${pkgdir}/opt/${pkgname}
}

# vim: set noet ff=unix:
