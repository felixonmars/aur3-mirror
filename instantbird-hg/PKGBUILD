# Contributor: Connor Behan <connor.behan@gmail.com>, Hugo Puhlmann <hugopuhlmann@gmail.com>

pkgname=instantbird-hg
pkgver=r16199.23794caa2fd4
pkgrel=1
pkgdesc="Instant messenger using libpurple and xulrunner"
arch=(i686 x86_64)
license=('MPL' 'GPL' 'LGPL')
url="http://instantbird.com"
depends=('xulrunner')
makedepends=('unzip' 'pkg-config' 'diffutils' 'python2' 'wireless_tools' 'yasm' 'libidl2' 'mesa' 'autoconf2.13')
source=(hg+http://hg.mozilla.org/comm-central mozconfig ${pkgname}.desktop)
md5sums=('SKIP' 'bdc40b3609939fa2b633ddff85bd51dc' '9149cae331413af6430c7b5b8f9cfd80')
options=('!buildflags' 'staticlibs')

build() {
	cp mozconfig ${srcdir}/comm-central/.mozconfig
	cd "${srcdir}"/comm-central
	/usr/bin/python2 client.py checkout
	# this is known issue ./mozilla/mach build *will* appear to have failed, even when it's successful
	/usr/bin/python2 ./mozilla/mach build || true
}

pkgver() {
	cd "${srcdir}"/comm-central
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	cd "${srcdir}"/comm-central/obj-x86_64-unknown-linux-gnu/mozilla/dist

	# This will take up more space but omni.ja appears to be broken
	# https://bugzilla.mozilla.org/show_bug.cgi?id=956509
	mkdir -p "${pkgdir}"/usr/bin
	mkdir -p "${pkgdir}"/usr/lib
	mkdir -p "${pkgdir}"/usr/share/pixmaps
	mkdir -p "${pkgdir}"/usr/share/applications
	cp -RL ./bin "${pkgdir}"/usr/lib/instantbird
	
	cd "${pkgdir}"/usr/bin
	ln -sf ${pkgdir}/usr/lib/instantbird/instantbird instantbird

	# No idea why this is needed now
	cd "${pkgdir}"/usr/lib/instantbird

	install -D -m 644 icons/mozicon128.png ../../share/pixmaps/instantbird.png
	install -D -m 644 "${srcdir}"/instantbird-hg.desktop ../../share/applications/instantbird-hg.desktop
}
