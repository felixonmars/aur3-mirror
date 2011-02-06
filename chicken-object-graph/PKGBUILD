# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-object-graph
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Graph description generator for graphs of arbitrary objects."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/object-graph"
license=('GPL3')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=object-graph&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/object-graph.html")
md5sums=('8e8d959f4c86c4d4c1ffcd8f74afa11a' 'dc4ae1d9f436b4b879a2466d76bfe292')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "object-graph-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "object-graph-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "object-graph-$pkgver/$fname"
		else
			dd iflag=fullblock of="object-graph-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/object-graph-$pkgver"
	cp ../$pkgname-$pkgver.html object-graph.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/object-graph"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "object-graph.html" "$pkgdir/usr/share/doc/$pkgname/object-graph.html"
}
