# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-27
pkgver=3.1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Sources of Random Bits"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-27"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors>=1.9.0' 'chicken-miscmacros>=2.8' 'chicken-vector-lib>=1.2' 'chicken-numbers>=1.809' 'chicken-synch>=2.1.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-27&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-27.html")
md5sums=('f51d20a9e61a32861f1d5617fad86f98' '9e80b3c31729e1f6b943be688449ac7b')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-27-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-27-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-27-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-27-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-27-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-27.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-27"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-27.html" "$pkgdir/usr/share/doc/$pkgname/srfi-27.html"
}
