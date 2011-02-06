# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-nemo
pkgver=4.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: A description language for computational models of ion channels."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/nemo"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-sxml-transforms' 'chicken-ssax' 'chicken-sxpath' 'chicken-datatype' 'chicken-vector-lib' 'chicken-environments' 'chicken-digraph' 'chicken-graph-bfs' 'chicken-graph-cycles' 'chicken-mathh' 'chicken-strictly-pretty' 'chicken-varsubst' 'chicken-lalr' 'chicken-getopt-long' 'chicken-setup-helper')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=nemo&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/nemo.html")
md5sums=('fc11cc8b68145d29ff0d981aca3aec30' '35d7e494c423e77c4a09d9fc9fe4abb4')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "nemo-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "nemo-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "nemo-$pkgver/$fname"
		else
			dd iflag=fullblock of="nemo-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/nemo-$pkgver"
	cp ../$pkgname-$pkgver.html nemo.html
	
	
	sed -r '/define SHARED-DIR \(chicken-home\)/ { s//define SHARED-DIR (installation-chicken-home)/; i (include "setup-helper")
}' -i.orig "nemo.setup"
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/nemo"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "nemo.html" "$pkgdir/usr/share/doc/$pkgname/nemo.html"
}
