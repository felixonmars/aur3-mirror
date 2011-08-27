# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-scbib
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Scientific bibliography management."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/scbib"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-datatype' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=scbib&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/scbib.html")
md5sums=('9598967d2b3c29f21741def31886fb75' '1cd7b59b8d84aa469926dac4a72de414')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "scbib-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "scbib-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "scbib-$pkgver/$fname"
		else
			dd iflag=fullblock of="scbib-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/scbib-$pkgver"
	cp ../$pkgname-$pkgver.html scbib.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/scbib"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "scbib.html" "$pkgdir/usr/share/doc/$pkgname/scbib.html"
}
