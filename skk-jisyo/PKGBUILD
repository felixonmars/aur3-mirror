# Contributor: jeneshicc <jeneshicc@gmail.com>
pkgname=skk-jisyo
pkgver=20120902
pkgrel=1
pkgdesc="Dictionaries for the SKK Japanese input method"
arch=('any')
url="http://openlab.ring.gr.jp/skk/"
optdepends=('skktools: Dictionary maintenabce tools')
license=('GPL')
install=${pkgname}.install
source=()
build() {
	cd ${srcdir}

	# download and install dictionaries
	for t in L jinmei geo propernoun station; do
		curl -O http://openlab.ring.gr.jp/skk/dic/SKK-JISYO.${t}.gz
		curl -O http://openlab.ring.gr.jp/skk/dic/SKK-JISYO.${t}.gz.md5
		md5sum -c SKK-JISYO.${t}.gz.md5 || return 1
		gzip -df SKK-JISYO.${t}.gz
    		install -D -m 644 ${srcdir}/SKK-JISYO.$t ${pkgdir}/usr/share/skk/SKK-JISYO.$t
	done

	# merge dictionaries
	#skkdic-expr2 SKK-JISYO.L + SKK-JISYO.geo + SKK-JISYO.jinmei \
	#	+ SKK-JISYO.propernoun + SKK-JISYO.station > SKK-JISYO.XL
	#install -D -m 644 ${srcdir}/SKK-JISYO.XL ${pkgdir}/usr/share/skk/SKK-JISYO.XL
}
