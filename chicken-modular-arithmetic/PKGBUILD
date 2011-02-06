# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-modular-arithmetic
pkgver=1.0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Modular Arithmetic on Finite Fields"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/modular-arithmetic"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-numbers' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=modular-arithmetic&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/modular-arithmetic.html")
md5sums=('8139f4cb4897beee70b79b003958b494' 'fb02e8f6c23dbe8843c4771c1c028702')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "modular-arithmetic-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "modular-arithmetic-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "modular-arithmetic-$pkgver/$fname"
		else
			dd iflag=fullblock of="modular-arithmetic-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/modular-arithmetic-$pkgver"
	cp ../$pkgname-$pkgver.html modular-arithmetic.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/modular-arithmetic"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "modular-arithmetic.html" "$pkgdir/usr/share/doc/$pkgname/modular-arithmetic.html"
}
