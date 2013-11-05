# Contributor: fnord0 <fnord0 AT riseup DOT net>
pkgname=loki
pkgver=0.2.7
pkgrel=1
pkgdesc="Python based framework implementing many packet generation and attack modules for Layer 2 and 3 protocols"
arch=('i686' 'x86_64')
url="http://c0decafe.de/loki.html"
license=('BSD')
depends=('python2' 'pygtk' 'python2-ipy' 'dpkt-svn' 'pylibpcap' 'libdnet' 'libglade' 'autoconf' 'automake')
source=("http://c0decafe.de/${pkgname}/${pkgname}-${pkgver}.tar.gz")
options=(!emptydirs)
md5sums=('31e849b6bb1d43444ecab972ef13e7db')
sha1sums=('42969aad191a5c62df141a4c5263786b033b37ef')


build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' ${srcdir}/${pkgname}-${pkgver}/src/loki.py
        grep -rl 'python-config' ${srcdir}/${pkgname}-${pkgver}/ | xargs sed -i 's|python-config|python2-config|g' || return 1
	aclocal && automake --add-missing && autoconf || return 1
	./configure --prefix=/usr PYTHON=/usr/bin/python2 || return 1
	make || return 1
}

package() {
        install -d ${pkgdir}/usr/bin || return 1
	install -d ${pkgdir}/usr/share/${pkgname} || return 1
	install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1

	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install || return 1
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
	install -Dm644 AUTHORS ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
        for doc in ChangeLog README REQUIREMENTS; do
          install -Dm644 ${doc} ${pkgdir}/usr/share/${pkgname}/${doc} || return 1
        done

	#user notification
	echo -e ""
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mrun '\e[0m\e[1;34m/usr/bin/loki.py\e[0m\e[1;31m' to start LOKI\e[0m"
	echo -e ""
	echo -e "\e[1;34m>>>\e[0m \e[1;31mLOKI homepage @ \e[0m\e[1;32mhttps://www.c0decafe.de/loki.html\e[0m"
	echo -e "\e[1;34m>>>\e[0m \e[1;31mLOKI demo @ \e[0m\e[1;32mhttps://www.c0decafe.de/loki/bh10-demos.tar.gz\e[0m"
	echo -e ""
}
# vim:syntax=sh
