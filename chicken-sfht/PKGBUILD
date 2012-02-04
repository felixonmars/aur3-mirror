# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sfht
pkgver=2.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: A dictionary data structure based on counting Bloom filters."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sfht"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-sparse-vectors' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sfht&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sfht.html")
md5sums=('c1f1e51818e1dee06feeec678962fe03' '1f9bc81b344b11754867f5860e716858')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sfht-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sfht-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sfht-$pkgver/$fname"
		else
			dd iflag=fullblock of="sfht-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sfht-$pkgver"
	cp ../$pkgname-$pkgver.html sfht.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sfht"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sfht.html" "$pkgdir/usr/share/doc/$pkgname/sfht.html"
}
