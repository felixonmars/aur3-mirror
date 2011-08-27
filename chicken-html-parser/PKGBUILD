# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-html-parser
pkgver=0.5.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: A permissive, scalable HTML parser."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/html-parser"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=html-parser&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/html-parser.html")
md5sums=('5ed2c12f2c9cfe1c2ff5d40149cd4d7a' '0040d9cec2fa351e5e25c87e3b46a173')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "html-parser-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "html-parser-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "html-parser-$pkgver/$fname"
		else
			dd iflag=fullblock of="html-parser-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/html-parser-$pkgver"
	cp ../$pkgname-$pkgver.html html-parser.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/html-parser"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "html-parser.html" "$pkgdir/usr/share/doc/$pkgname/html-parser.html"
}
