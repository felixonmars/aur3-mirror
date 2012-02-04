# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-neuromorpho
pkgver=1.9
pkgrel=4
pkgdesc="Chicken Scheme Egg: Access the NeuroMorpho database."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/neuromorpho"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-html-parser' 'chicken-sxml-transforms' 'chicken-sxpath' 'chicken-uri-generic' 'chicken-getopt-long' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=neuromorpho&version=$pkgver"
		)
md5sums=('a5e9344529846289e4523cabd02c6b50')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "neuromorpho-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "neuromorpho-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "neuromorpho-$pkgver/$fname"
		else
			dd iflag=fullblock of="neuromorpho-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/neuromorpho-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/neuromorpho"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
