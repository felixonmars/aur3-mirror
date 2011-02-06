# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-autoform-jquery
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: JQuery-based Javascript validators for autoform"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/autoform-jquery"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-autoform' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=autoform-jquery&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/autoform-jquery.html")
md5sums=('1076f8de71c84f9e0ae5ceb598fc146f' 'ae93d6173f420d45d2d4a068ca39415f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "autoform-jquery-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "autoform-jquery-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "autoform-jquery-$pkgver/$fname"
		else
			dd iflag=fullblock of="autoform-jquery-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/autoform-jquery-$pkgver"
	cp ../$pkgname-$pkgver.html autoform-jquery.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/autoform-jquery"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "autoform-jquery.html" "$pkgdir/usr/share/doc/$pkgname/autoform-jquery.html"
}
