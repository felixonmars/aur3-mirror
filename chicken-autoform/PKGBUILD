# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-autoform
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Generates HTML forms out of database structures"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/autoform"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-sql-null' 'chicken-html-tags' 'chicken-html-utils' 'chicken-spiffy-request-vars' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=autoform&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/autoform.html")
md5sums=('9b205bb21c2d5d6a5831c502ec015dcf' '6a9a6578153ff9f9fd854bafe66bd1ed')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "autoform-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "autoform-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "autoform-$pkgver/$fname"
		else
			dd iflag=fullblock of="autoform-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/autoform-$pkgver"
	cp ../$pkgname-$pkgver.html autoform.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/autoform"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "autoform.html" "$pkgdir/usr/share/doc/$pkgname/autoform.html"
}
