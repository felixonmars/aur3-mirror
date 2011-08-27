# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-41
pkgver=1.2.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: SRFI 41 (Streams)"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-41"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors>=1.12.1' 'chicken-combinators>=1.2.0' 'chicken-record-variants>=0.5' 'chicken-numbers' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-41&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-41.html")
md5sums=('b77c9d1db44c99e374510153baa57c69' 'e160eb4eb1cd1d5290fb4e17e26da4c5')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-41-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-41-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-41-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-41-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-41-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-41.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-41"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-41.html" "$pkgdir/usr/share/doc/$pkgname/srfi-41.html"
}
