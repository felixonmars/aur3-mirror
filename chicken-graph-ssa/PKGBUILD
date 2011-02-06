# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-graph-ssa
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Compute static single assignment form of a graph."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/graph-ssa"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-graph-dominators' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=graph-ssa&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/graph-ssa.html")
md5sums=('bbacf96ee3f4cacc988dba2322fb8380' 'cb98e9568ec84aac43dc72551bd7ca64')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "graph-ssa-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "graph-ssa-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "graph-ssa-$pkgver/$fname"
		else
			dd iflag=fullblock of="graph-ssa-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/graph-ssa-$pkgver"
	cp ../$pkgname-$pkgver.html graph-ssa.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/graph-ssa"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "graph-ssa.html" "$pkgdir/usr/share/doc/$pkgname/graph-ssa.html"
}
