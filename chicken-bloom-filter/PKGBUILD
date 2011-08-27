# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-bloom-filter
pkgver=1.1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Bloom Filter"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/bloom-filter"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper>=1.2.0' 'chicken-iset>=1.7' 'chicken-message-digest>=2.3.1' 'chicken-hashes>=1.1.0' 'chicken-moremacros>=1.1.1' 'chicken-check-errors>=1.12.0' 'chicken-record-variants>=0.5' 'chicken-mathh>=2.2.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=bloom-filter&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/bloom-filter.html")
md5sums=('ccb21c6431d8cc43ab5ab35f0d688328' '6e8aa37023f9b1461a2adcd050392413')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "bloom-filter-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "bloom-filter-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "bloom-filter-$pkgver/$fname"
		else
			dd iflag=fullblock of="bloom-filter-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/bloom-filter-$pkgver"
	cp ../$pkgname-$pkgver.html bloom-filter.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/bloom-filter"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "bloom-filter.html" "$pkgdir/usr/share/doc/$pkgname/bloom-filter.html"
}
