# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-fmt
pkgver=0.704
pkgrel=4
pkgdesc="Chicken Scheme Egg: Combinator Formatting"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/fmt"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-utf8' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=fmt&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/fmt.html")
md5sums=('97305db11c825b1c5ca11f008b49ff60' 'd12d5786055fc6fb80056baf50e1e2e6')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "fmt-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "fmt-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "fmt-$pkgver/$fname"
		else
			dd iflag=fullblock of="fmt-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/fmt-$pkgver"
	cp ../$pkgname-$pkgver.html fmt.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/fmt"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "fmt.html" "$pkgdir/usr/share/doc/$pkgname/fmt.html"
}
