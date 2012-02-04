# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-graph-dominators
pkgver=1.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: Find immediate dominators in a directed graph."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/graph-dominators"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=graph-dominators&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/graph-dominators.html")
md5sums=('dfd8d40fa9e9ea9201b6b6f5b4d58188' '2b5c78bdf8ae7174d8d133a8ef57f9be')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "graph-dominators-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "graph-dominators-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "graph-dominators-$pkgver/$fname"
		else
			dd iflag=fullblock of="graph-dominators-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/graph-dominators-$pkgver"
	cp ../$pkgname-$pkgver.html graph-dominators.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/graph-dominators"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "graph-dominators.html" "$pkgdir/usr/share/doc/$pkgname/graph-dominators.html"
}
