# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-statistics
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Statistics library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/statistics"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-srfi-25' 'chicken-vector-lib' 'chicken-numbers' 'chicken-format' 'gsl')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=statistics&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/statistics.html")
md5sums=('27fd06a218520b0803a4b343e15f343f' '8f0b1fae84a86fe25bcd8b459166c161')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "statistics-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "statistics-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "statistics-$pkgver/$fname"
		else
			dd iflag=fullblock of="statistics-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/statistics-$pkgver"
	cp ../$pkgname-$pkgver.html statistics.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/statistics"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "statistics.html" "$pkgdir/usr/share/doc/$pkgname/statistics.html"
}
