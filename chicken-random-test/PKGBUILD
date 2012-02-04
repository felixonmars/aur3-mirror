# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-random-test
pkgver=1.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: Some simple randomness tests for a sequence of numbers."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/random-test"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-eggdoc' 'chicken-easyffi' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=random-test&version=$pkgver"
		)
md5sums=('9e867c6a569931b48dc2251f9dee929b')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "random-test-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "random-test-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "random-test-$pkgver/$fname"
		else
			dd iflag=fullblock of="random-test-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/random-test-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/random-test"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
