# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-base64
pkgver=3.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Encoding and decoding of base64 strings"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/base64"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=base64&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/base64.html")
md5sums=('b1e4c11e4a1dc1f67279b2b8616f2667' 'ba2dfec807273da30ff7235738533123')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "base64-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "base64-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "base64-$pkgver/$fname"
		else
			dd iflag=fullblock of="base64-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/base64-$pkgver"
	cp ../$pkgname-$pkgver.html base64.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/base64"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "base64.html" "$pkgdir/usr/share/doc/$pkgname/base64.html"
}
