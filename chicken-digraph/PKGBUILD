# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-digraph
pkgver=1.12
pkgrel=4
pkgdesc="Chicken Scheme Egg: Directed graph in adjacency list format."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/digraph"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-dyn-vector' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=digraph&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/digraph.html")
md5sums=('8bbcbb5ae3d1f26e54111bedf192e49f' '8792038e6eefa00a56d1ea5653a3bc1e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "digraph-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "digraph-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "digraph-$pkgver/$fname"
		else
			dd iflag=fullblock of="digraph-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/digraph-$pkgver"
	cp ../$pkgname-$pkgver.html digraph.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/digraph"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "digraph.html" "$pkgdir/usr/share/doc/$pkgname/digraph.html"
}
