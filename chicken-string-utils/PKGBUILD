# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-string-utils
pkgver=1.1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: String Utilities"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/string-utils"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-miscmacros>=2.9' 'chicken-lookup-table>=1.13.1' 'chicken-check-errors>=1.12.1' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=string-utils&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/string-utils.html")
md5sums=('1409a1389c3d29217a9ce5264b5526f4' 'bf26d53b5f52ec16d59afbdad4edd46e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "string-utils-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "string-utils-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "string-utils-$pkgver/$fname"
		else
			dd iflag=fullblock of="string-utils-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/string-utils-$pkgver"
	cp ../$pkgname-$pkgver.html string-utils.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/string-utils"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "string-utils.html" "$pkgdir/usr/share/doc/$pkgname/string-utils.html"
}
