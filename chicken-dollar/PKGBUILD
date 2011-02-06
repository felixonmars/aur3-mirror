# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-dollar
pkgver=2.0.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: FFI convenience macro"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/dollar"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=dollar&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/dollar.html")
md5sums=('21aca4ccd83b55800b15f12cdf9d5363' 'bfc9ad02555ed20a05af404e62eb51c1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "dollar-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "dollar-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "dollar-$pkgver/$fname"
		else
			dd iflag=fullblock of="dollar-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/dollar-$pkgver"
	cp ../$pkgname-$pkgver.html dollar.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/dollar"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "dollar.html" "$pkgdir/usr/share/doc/$pkgname/dollar.html"
}
