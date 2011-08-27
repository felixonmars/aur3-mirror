# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-format-graph
pkgver=1.8
pkgrel=4
pkgdesc="Chicken Scheme Egg: Prints a graph in various formats."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/format-graph"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=format-graph&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/format-graph.html")
md5sums=('8ab5e43e219914abdda3a6d5f68d1c83' '9a2db04a71a4366c4e79320a723bfb9e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "format-graph-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "format-graph-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "format-graph-$pkgver/$fname"
		else
			dd iflag=fullblock of="format-graph-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/format-graph-$pkgver"
	cp ../$pkgname-$pkgver.html format-graph.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/format-graph"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "format-graph.html" "$pkgdir/usr/share/doc/$pkgname/format-graph.html"
}
