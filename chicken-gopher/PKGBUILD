# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-gopher
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Basic Gopher protocol interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/gopher"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-sendfile' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=gopher&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/gopher.html")
md5sums=('69ca1ec27a884c4326221ecc9e0c055e' 'c1816a1b059820eb96944bf86e341ce2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "gopher-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "gopher-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "gopher-$pkgver/$fname"
		else
			dd iflag=fullblock of="gopher-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/gopher-$pkgver"
	cp ../$pkgname-$pkgver.html gopher.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/gopher"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "gopher.html" "$pkgdir/usr/share/doc/$pkgname/gopher.html"
}
