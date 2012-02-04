# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-getopt-long
pkgver=1.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: Command line option parsing."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/getopt-long"
license=('LGPL3')
depends=('chicken>=4.5.0' 'chicken-defstruct' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=getopt-long&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/getopt-long.html")
md5sums=('9afcb94e334b2afd76734fc5cecea645' 'c2eeddbc1311152080ab4bdc5779c623')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "getopt-long-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "getopt-long-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "getopt-long-$pkgver/$fname"
		else
			dd iflag=fullblock of="getopt-long-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/getopt-long-$pkgver"
	cp ../$pkgname-$pkgver.html getopt-long.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/getopt-long"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "getopt-long.html" "$pkgdir/usr/share/doc/$pkgname/getopt-long.html"
}
