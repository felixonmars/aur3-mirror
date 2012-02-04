# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-graph-scc
pkgver=1.9
pkgrel=4
pkgdesc="Chicken Scheme Egg: Compute strongly-connected components (SCC) of a graph."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/graph-scc"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-iset' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=graph-scc&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/graph-scc.html")
md5sums=('e873993973f8411f7015be7cb84fa0d3' '8717a7b7b8af43c7519ad4d921efc558')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "graph-scc-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "graph-scc-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "graph-scc-$pkgver/$fname"
		else
			dd iflag=fullblock of="graph-scc-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/graph-scc-$pkgver"
	cp ../$pkgname-$pkgver.html graph-scc.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/graph-scc"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "graph-scc.html" "$pkgdir/usr/share/doc/$pkgname/graph-scc.html"
}
