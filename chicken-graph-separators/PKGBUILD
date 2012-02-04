# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-graph-separators
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Determine the separation vertices of a graph."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/graph-separators"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=graph-separators&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/graph-separators.html")
md5sums=('74aff17be3a340a24ce3c1bf17eefe49' '411d0bc538c439b7185234721782c979')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "graph-separators-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "graph-separators-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "graph-separators-$pkgver/$fname"
		else
			dd iflag=fullblock of="graph-separators-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/graph-separators-$pkgver"
	cp ../$pkgname-$pkgver.html graph-separators.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/graph-separators"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "graph-separators.html" "$pkgdir/usr/share/doc/$pkgname/graph-separators.html"
}
