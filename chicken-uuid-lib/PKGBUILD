# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-uuid-lib
pkgver=1.3.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: OSF DCE 1.1 UUID"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/uuid-lib"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'util-linux-ng')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=uuid-lib&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/uuid-lib.html")
md5sums=('dd2728ded7fa49fe155ee14a3eed56fa' '07b8c6b70cca27b3855934334ee14946')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "uuid-lib-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "uuid-lib-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "uuid-lib-$pkgver/$fname"
		else
			dd iflag=fullblock of="uuid-lib-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/uuid-lib-$pkgver"
	cp ../$pkgname-$pkgver.html uuid-lib.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/uuid-lib"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "uuid-lib.html" "$pkgdir/usr/share/doc/$pkgname/uuid-lib.html"
}
