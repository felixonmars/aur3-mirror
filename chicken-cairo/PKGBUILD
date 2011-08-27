# Maintainer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-cairo
pkgver=0.1.5
pkgrel=3
pkgdesc="Chicken Scheme Egg: Chicken bindings for Cairo, a vector graphics library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/cairo"
license=('LGPL')
depends=('chicken>=4.0.0' 'chicken-eggdoc' 'cairo')
options=(docs !libtool)
source=("${pkgname}-${pkgver}.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=cairo&version=${pkgver}"
		)
install="chicken.install"

build() {
	cd "$srcdir"
	mkdir -p "${pkgname#chicken-}-${pkgver}"
	cat "${pkgname}-${pkgver}.chunked" | while :; do
		while read -r bar fname len; do
			[[ -n "$fname" ]] && break
		done
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "${pkgname#chicken-}-${pkgver}/$fname" || return 1
		else
			dd of="${pkgname#chicken-}-${pkgver}/$fname" ibs="$len" count=1 2>/dev/null || return 1
		fi
	done
	cd "${pkgname#chicken-}-${pkgver}"
	

	
	CHICKEN_INSTALL_PREFIX="${pkgdir}/usr" chicken-install || return 1
	
}

# vim:syntax=sh:
md5sums=('eb88c2f7f69fcf1f3b06a2e8eed200ef')
