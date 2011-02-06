# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-vector-lib
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Port of the SRFI-43 reference implementation"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/vector-lib"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=vector-lib&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/vector-lib.html")
md5sums=('ce32677201b327d79dbd9607223fdaeb' 'dab2b83bc57aa4b99e04418e237a16aa')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "vector-lib-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "vector-lib-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "vector-lib-$pkgver/$fname"
		else
			dd iflag=fullblock of="vector-lib-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/vector-lib-$pkgver"
	cp ../$pkgname-$pkgver.html vector-lib.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/vector-lib"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "vector-lib.html" "$pkgdir/usr/share/doc/$pkgname/vector-lib.html"
}
