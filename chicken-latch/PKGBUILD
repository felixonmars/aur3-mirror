# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-latch
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: evaluating expressions just once"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/latch"
license=('unknown')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=latch&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/latch.html")
md5sums=('8161204c07850fb89ca9b03cb7685ccc' '183f4cde40b61d32ae3585f3b87fedc1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "latch-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "latch-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "latch-$pkgver/$fname"
		else
			dd iflag=fullblock of="latch-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/latch-$pkgver"
	cp ../$pkgname-$pkgver.html latch.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/latch"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "latch.html" "$pkgdir/usr/share/doc/$pkgname/latch.html"
}
