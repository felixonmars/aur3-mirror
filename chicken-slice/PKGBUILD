# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-slice
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: A slicer procedure for lists, strings and vectors"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/slice"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=slice&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/slice.html")
md5sums=('e7b31a33411d6fa2e7ac7b6131ba77a9' '4f7975b4cdb3c18d0ba7e3cd70213384')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "slice-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "slice-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "slice-$pkgver/$fname"
		else
			dd iflag=fullblock of="slice-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/slice-$pkgver"
	cp ../$pkgname-$pkgver.html slice.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/slice"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "slice.html" "$pkgdir/usr/share/doc/$pkgname/slice.html"
}
