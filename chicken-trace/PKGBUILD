# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-trace
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: tracing and breakpoints"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/trace"
license=('public')
depends=('chicken>=4.5.0' 'chicken-advice' 'chicken-miscmacros' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=trace&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/trace.html")
md5sums=('35b81d8a532515a0d3d53a7d19545a47' 'b2e983bd0d5a651fa62190eb851c9a77')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "trace-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "trace-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "trace-$pkgver/$fname"
		else
			dd iflag=fullblock of="trace-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/trace-$pkgver"
	cp ../$pkgname-$pkgver.html trace.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/trace"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "trace.html" "$pkgdir/usr/share/doc/$pkgname/trace.html"
}
