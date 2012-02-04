# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-yelp
pkgver=1.0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to the Yelp developer API"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/yelp"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-json' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=yelp&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/yelp.html")
md5sums=('fff71ead4aec9e14f205ca9cb373011f' 'f82e29367eb311ed597bbf8033bbac24')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "yelp-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "yelp-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "yelp-$pkgver/$fname"
		else
			dd iflag=fullblock of="yelp-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/yelp-$pkgver"
	cp ../$pkgname-$pkgver.html yelp.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/yelp"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "yelp.html" "$pkgdir/usr/share/doc/$pkgname/yelp.html"
}
