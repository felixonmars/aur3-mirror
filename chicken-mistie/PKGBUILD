# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mistie
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: A programmable filter"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mistie"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-eggdoc' 'chicken-setup-helper')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mistie&version=$pkgver"
		)
md5sums=('472596d14ac99740dd1da67250c958d2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "mistie-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "mistie-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "mistie-$pkgver/$fname"
		else
			dd iflag=fullblock of="mistie-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/mistie-$pkgver"
	
	
	
	sed -r '/define SHARED-DIR \(chicken-home\)/ { s//define SHARED-DIR (installation-chicken-home)/; i (include "setup-helper")
}' -i.orig "mistie.setup"
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/mistie"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
