# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-4-utils
pkgver=1.6
pkgrel=4
pkgdesc="Chicken Scheme Egg: Utility functions for SRFI-4 vectors."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-4-utils"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-srfi-42' 'chicken-srfi-4-comprehensions' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-4-utils&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-4-utils.html")
md5sums=('4695b4da71706760fefd8dcf11013be3' '5f2ac5ede17dbad7f83a2d18cd475124')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-4-utils-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-4-utils-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-4-utils-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-4-utils-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-4-utils-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-4-utils.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-4-utils"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-4-utils.html" "$pkgdir/usr/share/doc/$pkgname/srfi-4-utils.html"
}
