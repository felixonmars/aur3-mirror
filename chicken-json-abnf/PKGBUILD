# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-json-abnf
pkgver=3.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parser combinators for JavaScript Object Notation (JSON)."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/json-abnf"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-abnf>=3.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=json-abnf&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/json-abnf.html")
md5sums=('2e4c83fd6ac01a85808d372d1f616cf7' 'dbec5efcb6c1faa8b2a9a67c0dd3577c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "json-abnf-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "json-abnf-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "json-abnf-$pkgver/$fname"
		else
			dd iflag=fullblock of="json-abnf-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/json-abnf-$pkgver"
	cp ../$pkgname-$pkgver.html json-abnf.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/json-abnf"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "json-abnf.html" "$pkgdir/usr/share/doc/$pkgname/json-abnf.html"
}
