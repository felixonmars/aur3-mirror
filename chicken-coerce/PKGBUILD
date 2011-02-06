# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-coerce
pkgver=1.1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Type Identity & Coercion"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/coerce"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-miscmacros' 'chicken-lookup-table>=1.11.0' 'chicken-check-errors>=1.5.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=coerce&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/coerce.html")
md5sums=('bbaed63e22c94730825423fe3e40846f' 'c59c66b6fb4d50abdfd5493f835c3f81')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "coerce-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "coerce-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "coerce-$pkgver/$fname"
		else
			dd iflag=fullblock of="coerce-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/coerce-$pkgver"
	cp ../$pkgname-$pkgver.html coerce.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/coerce"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "coerce.html" "$pkgdir/usr/share/doc/$pkgname/coerce.html"
}
