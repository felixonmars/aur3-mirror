# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-graph-dfs
pkgver=1.9
pkgrel=4
pkgdesc="Chicken Scheme Egg: Depth-first search in a graph."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/graph-dfs"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-iset' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=graph-dfs&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/graph-dfs.html")
md5sums=('82abb70a565cada0c69bc000a07cb1d8' '0ae55bb1e3894d56330dcae469f62a97')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "graph-dfs-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "graph-dfs-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "graph-dfs-$pkgver/$fname"
		else
			dd iflag=fullblock of="graph-dfs-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/graph-dfs-$pkgver"
	cp ../$pkgname-$pkgver.html graph-dfs.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/graph-dfs"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "graph-dfs.html" "$pkgdir/usr/share/doc/$pkgname/graph-dfs.html"
}
