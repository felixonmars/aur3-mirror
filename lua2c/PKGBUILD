# Maintainer Kovivchak Evgen <oneonfire@gmail.com>

pkgname=lua2c
pkgver=latest
pkgrel=2
pkgdesc="Converts Lua 5.1 source code to C code."
arch=('any')
url="https://github.com/davidm/lua2c"
license=('MIT')
depends=(lua51)
source=(lua2c-${pkgver}.zip::https://github.com/davidm/lua2c/zipball/master
lua2c.patch)
md5sums=('9a56ba5b4e94d2fa4f4aef0b95453082'
			    '25f869aac6e6570d9a2647b16b81f6df')

build() {
	cd ${srcdir}/davidm-${pkgname}-c5b239d
	patch -Np1 -i "${srcdir}/lua2c.patch"
	install -m755 -D ${pkgname}.lua ${pkgdir}/usr/bin/${pkgname}.lua 
	ln -s ${pkgdir}/usr/bin/${pkgname}.lua ${pkgdir}/usr/bin/${pkgname}
	install -m755 -D clua ${pkgdir}/usr/bin/clua 
	mkdir -p ${pkgdir}/usr/lib/lua/5.1
	cp -r lib/* ${pkgdir}/usr/lib/lua/5.1/
	# license 	
	install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

