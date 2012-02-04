# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-uri-common
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parser for common URI schemes"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/uri-common"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-uri-generic>=2.3' 'chicken-defstruct' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=uri-common&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/uri-common.html")
md5sums=('2bcb1c38bd7ad05f945f9cec82f0d39e' '4826436cac149c990a80806f78d0ae2a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "uri-common-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "uri-common-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "uri-common-$pkgver/$fname"
		else
			dd iflag=fullblock of="uri-common-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/uri-common-$pkgver"
	cp ../$pkgname-$pkgver.html uri-common.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/uri-common"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "uri-common.html" "$pkgdir/usr/share/doc/$pkgname/uri-common.html"
}
