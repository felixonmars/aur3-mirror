# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-graph-bfs
pkgver=1.12
pkgrel=4
pkgdesc="Chicken Scheme Egg: Breadth-first search in a graph."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/graph-bfs"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-iset' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=graph-bfs&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/graph-bfs.html")
md5sums=('93d06a3e6fdecd7e58ffec629ed57952' 'abe36da6ed4aad3a2416381eef6c789a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "graph-bfs-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "graph-bfs-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "graph-bfs-$pkgver/$fname"
		else
			dd iflag=fullblock of="graph-bfs-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/graph-bfs-$pkgver"
	cp ../$pkgname-$pkgver.html graph-bfs.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/graph-bfs"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "graph-bfs.html" "$pkgdir/usr/share/doc/$pkgname/graph-bfs.html"
}
