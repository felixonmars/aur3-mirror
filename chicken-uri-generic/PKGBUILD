# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-uri-generic
pkgver=2.35
pkgrel=4
pkgdesc="Chicken Scheme Egg: URI generic syntax (RFC 3986) parsing and manipulation."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/uri-generic"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-defstruct' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=uri-generic&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/uri-generic.html")
md5sums=('110e2c0e490f3a5139d8bb5644c8d887' '498845ef53f20e518ba048fbba8dfe2c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "uri-generic-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "uri-generic-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "uri-generic-$pkgver/$fname"
		else
			dd iflag=fullblock of="uri-generic-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/uri-generic-$pkgver"
	cp ../$pkgname-$pkgver.html uri-generic.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/uri-generic"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "uri-generic.html" "$pkgdir/usr/share/doc/$pkgname/uri-generic.html"
}
