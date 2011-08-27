# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-banterpixra
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: A tool to generate syntax diagrams (in SVG format) from BNF-esque grammars"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/banterpixra"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-sxpath' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=banterpixra&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/banterpixra.html")
md5sums=('1c97a396cb583467b8853232731d8017' 'e0999518be4e73b5cf054deab929f101')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "banterpixra-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "banterpixra-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "banterpixra-$pkgver/$fname"
		else
			dd iflag=fullblock of="banterpixra-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/banterpixra-$pkgver"
	cp ../$pkgname-$pkgver.html banterpixra.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/banterpixra"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "banterpixra.html" "$pkgdir/usr/share/doc/$pkgname/banterpixra.html"
}
