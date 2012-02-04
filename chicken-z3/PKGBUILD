# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-z3
pkgver=1.41
pkgrel=4
pkgdesc="Chicken Scheme Egg: A gzip (RFC1952) compression and decompression library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/z3"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=z3&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/z3.html")
md5sums=('a6ffe3a8791c8ff51c3a8c31715c339b' '41863df9ecd388ba93f4289ed265032a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "z3-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "z3-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "z3-$pkgver/$fname"
		else
			dd iflag=fullblock of="z3-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/z3-$pkgver"
	cp ../$pkgname-$pkgver.html z3.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/z3"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "z3.html" "$pkgdir/usr/share/doc/$pkgname/z3.html"
}
