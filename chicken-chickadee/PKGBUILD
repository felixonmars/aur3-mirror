# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-chickadee
pkgver=0.9.6
pkgrel=4
pkgdesc="Chicken Scheme Egg: chicken-doc web server"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/chickadee"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-uri-common' 'chicken-intarweb' 'chicken-spiffy>=4.8' 'chicken-spiffy-request-vars' 'chicken-html-tags' 'chicken-html-utils' 'chicken-chicken-doc>=0.4.0' 'chicken-sxml-transforms' 'chicken-uri-generic' 'chicken-chicken-doc-admin>=0.4.0' 'chicken-colorize>=0.2.2' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=chickadee&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/chickadee.html")
md5sums=('9e4ffe63bf300e0560380889cd9ad8a6' '9e82d335fc69f50a39784c034cc1ece6')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "chickadee-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "chickadee-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "chickadee-$pkgver/$fname"
		else
			dd iflag=fullblock of="chickadee-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/chickadee-$pkgver"
	cp ../$pkgname-$pkgver.html chickadee.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/chickadee"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "chickadee.html" "$pkgdir/usr/share/doc/$pkgname/chickadee.html"
}
