# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-csv
pkgver=3.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parsing and formatting of comma-separated values (CSV)."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/csv"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-abnf' 'chicken-typeclass' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=csv&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/csv.html")
md5sums=('7c0444a317ebdcb82e648cb72eaf1b2d' '3faa41c5277760d0bcc474283d670fbf')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "csv-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "csv-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "csv-$pkgver/$fname"
		else
			dd iflag=fullblock of="csv-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/csv-$pkgver"
	cp ../$pkgname-$pkgver.html csv.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/csv"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "csv.html" "$pkgdir/usr/share/doc/$pkgname/csv.html"
}
