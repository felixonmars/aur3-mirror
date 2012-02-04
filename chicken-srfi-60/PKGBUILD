# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-60
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Integers as bits"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-60"
license=('custom:Artistic')
depends=('chicken>=4.5.0' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-60&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-60.html")
md5sums=('b98db1b210a630c90ecc16006305f8ff' '04bfb8ab2a0cd5605697f9f96a0e0e72')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-60-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-60-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-60-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-60-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-60-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-60.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-60"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-60.html" "$pkgdir/usr/share/doc/$pkgname/srfi-60.html"
}
