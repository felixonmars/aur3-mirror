# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-iexpr
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parser for I-expressions (SRFI-49)."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/iexpr"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-datatype' 'chicken-silex' 'chicken-lalr' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=iexpr&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/iexpr.html")
md5sums=('51a6366d6010a116035e957a74665398' '9ad8215f665d682bd29d3c0f8c8bb373')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "iexpr-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "iexpr-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "iexpr-$pkgver/$fname"
		else
			dd iflag=fullblock of="iexpr-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/iexpr-$pkgver"
	cp ../$pkgname-$pkgver.html iexpr.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/iexpr"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "iexpr.html" "$pkgdir/usr/share/doc/$pkgname/iexpr.html"
}
