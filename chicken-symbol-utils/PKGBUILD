# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-symbol-utils
pkgver=1.0.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: symbol-utils"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/symbol-utils"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors>=1.9.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=symbol-utils&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/symbol-utils.html")
md5sums=('06da53c3f6d4b21bc344c70748856913' '64c1f1d9237a05e6c1ca67f694180d2d')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "symbol-utils-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "symbol-utils-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "symbol-utils-$pkgver/$fname"
		else
			dd iflag=fullblock of="symbol-utils-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/symbol-utils-$pkgver"
	cp ../$pkgname-$pkgver.html symbol-utils.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/symbol-utils"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "symbol-utils.html" "$pkgdir/usr/share/doc/$pkgname/symbol-utils.html"
}
