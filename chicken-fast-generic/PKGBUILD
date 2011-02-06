# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-fast-generic
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: fast-generic functions"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/fast-generic"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=fast-generic&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/fast-generic.html")
md5sums=('b1f558cb84bc1c8f3bd40f8d49c8b026' '3c9c314f746ffce1d86ad411228bb0b3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "fast-generic-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "fast-generic-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "fast-generic-$pkgver/$fname"
		else
			dd iflag=fullblock of="fast-generic-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/fast-generic-$pkgver"
	cp ../$pkgname-$pkgver.html fast-generic.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/fast-generic"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "fast-generic.html" "$pkgdir/usr/share/doc/$pkgname/fast-generic.html"
}
