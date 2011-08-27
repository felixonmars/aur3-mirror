# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-chicken-doc
pkgver=0.4.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Explore Chicken documentation locally"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/chicken-doc"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-fmt>=0.703' 'chicken-sxml-transforms' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=chicken-doc&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/chicken-doc.html")
md5sums=('91f32c88e65343da58632d42b5040b19' '6d4777761c8b534823724c534069d2c6')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "chicken-doc-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "chicken-doc-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "chicken-doc-$pkgver/$fname"
		else
			dd iflag=fullblock of="chicken-doc-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/chicken-doc-$pkgver"
	cp ../$pkgname-$pkgver.html chicken-doc.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/chicken-doc"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "chicken-doc.html" "$pkgdir/usr/share/doc/$pkgname/chicken-doc.html"
}
