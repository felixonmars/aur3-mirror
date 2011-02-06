# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-lexgen
pkgver=4.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Lexer combinators."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/lexgen"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-typeclass' 'chicken-input-classes' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=lexgen&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/lexgen.html")
md5sums=('463d6b183da48ae5b3d3b0deeb2d94c8' 'e8f905b85b44670391f7d59e5cad0e5f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "lexgen-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "lexgen-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "lexgen-$pkgver/$fname"
		else
			dd iflag=fullblock of="lexgen-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/lexgen-$pkgver"
	cp ../$pkgname-$pkgver.html lexgen.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/lexgen"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "lexgen.html" "$pkgdir/usr/share/doc/$pkgname/lexgen.html"
}
