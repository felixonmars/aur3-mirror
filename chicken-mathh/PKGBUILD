# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mathh
pkgver=2.2.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: ISO C math functions and constants"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mathh"
license=('public')
depends=('chicken>=4.5.0' 'chicken-setup-helper>=1.2.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mathh&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/mathh.html")
md5sums=('98f79543dcb261c697f1cccc8b9b27e5' '81b08acad7978c2dd8a6b0a2502262fb')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "mathh-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "mathh-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "mathh-$pkgver/$fname"
		else
			dd iflag=fullblock of="mathh-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/mathh-$pkgver"
	cp ../$pkgname-$pkgver.html mathh.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/mathh"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "mathh.html" "$pkgdir/usr/share/doc/$pkgname/mathh.html"
}
