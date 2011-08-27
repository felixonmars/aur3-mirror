# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-estraier-client
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: A pure Scheme Hyper Estraier client library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/estraier-client"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-http-client' 'chicken-uri-common>=0.9' 'chicken-intarweb' 'hyperestraier')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=estraier-client&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/estraier-client.html")
md5sums=('059f7745d91bcf75449f22697562c51d' '69f12cf4f9fa59ccbbd610a6ae99d943')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "estraier-client-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "estraier-client-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "estraier-client-$pkgver/$fname"
		else
			dd iflag=fullblock of="estraier-client-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/estraier-client-$pkgver"
	cp ../$pkgname-$pkgver.html estraier-client.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/estraier-client"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "estraier-client.html" "$pkgdir/usr/share/doc/$pkgname/estraier-client.html"
}
