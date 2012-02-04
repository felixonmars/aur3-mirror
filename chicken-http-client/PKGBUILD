# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-http-client
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: High-level HTTP client library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/http-client"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-intarweb' 'chicken-openssl' 'chicken-uri-common>=0.7' 'chicken-md5' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=http-client&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/http-client.html")
md5sums=('65eb252827ccc275f528e35e3ca2b8c3' '62ef75c5f9a0ec4b41bf88bc702be2d9')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "http-client-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "http-client-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "http-client-$pkgver/$fname"
		else
			dd iflag=fullblock of="http-client-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/http-client-$pkgver"
	cp ../$pkgname-$pkgver.html http-client.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/http-client"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "http-client.html" "$pkgdir/usr/share/doc/$pkgname/http-client.html"
}
