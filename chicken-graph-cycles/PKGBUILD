# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-graph-cycles
pkgver=1.9
pkgrel=4
pkgdesc="Chicken Scheme Egg: Enumerate all simple cycles in a graph."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/graph-cycles"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-iset' 'chicken-matchable' 'chicken-graph-scc' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=graph-cycles&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/graph-cycles.html")
md5sums=('e83d87b687775caef5898c80ae53601c' '3a15fed2edfb943ba3cde0b484f9015a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "graph-cycles-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "graph-cycles-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "graph-cycles-$pkgver/$fname"
		else
			dd iflag=fullblock of="graph-cycles-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/graph-cycles-$pkgver"
	cp ../$pkgname-$pkgver.html graph-cycles.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/graph-cycles"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "graph-cycles.html" "$pkgdir/usr/share/doc/$pkgname/graph-cycles.html"
}
