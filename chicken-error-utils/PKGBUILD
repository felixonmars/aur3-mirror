# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-error-utils
pkgver=1.0.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Error Utilities"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/error-utils"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-moremacros>=1.1.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=error-utils&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/error-utils.html")
md5sums=('c1cf9278208f61c596375ba2a0dfbc01' 'e2d73688b2d54cc1ea2682a7cb91b377')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "error-utils-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "error-utils-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "error-utils-$pkgver/$fname"
		else
			dd iflag=fullblock of="error-utils-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/error-utils-$pkgver"
	cp ../$pkgname-$pkgver.html error-utils.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/error-utils"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "error-utils.html" "$pkgdir/usr/share/doc/$pkgname/error-utils.html"
}
