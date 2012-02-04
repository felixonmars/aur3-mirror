# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-amb
pkgver=2.1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: The non-deterministic backtracking ambivalence operator"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/amb"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-miscmacros>=2.91' 'chicken-check-errors>=1.12.0' 'chicken-condition-utils>=1.0.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=amb&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/amb.html")
md5sums=('a14cf700e2f78f3c916733c51c955c77' 'c0027f14ff263f08d482e4135ea63eae')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "amb-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "amb-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "amb-$pkgver/$fname"
		else
			dd iflag=fullblock of="amb-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/amb-$pkgver"
	cp ../$pkgname-$pkgver.html amb.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/amb"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "amb.html" "$pkgdir/usr/share/doc/$pkgname/amb.html"
}
