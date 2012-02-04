# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-dyn-vector
pkgver=1.11
pkgrel=4
pkgdesc="Chicken Scheme Egg: Dynamic (dense) vectors based on SRFI-43."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/dyn-vector"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-vector-lib' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=dyn-vector&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/dyn-vector.html")
md5sums=('32347a87bfaea34c4514c784f4f63569' '113c7c279a2b1585e9590929b2971982')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "dyn-vector-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "dyn-vector-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "dyn-vector-$pkgver/$fname"
		else
			dd iflag=fullblock of="dyn-vector-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/dyn-vector-$pkgver"
	cp ../$pkgname-$pkgver.html dyn-vector.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/dyn-vector"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "dyn-vector.html" "$pkgdir/usr/share/doc/$pkgname/dyn-vector.html"
}
