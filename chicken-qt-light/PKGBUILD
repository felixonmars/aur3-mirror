# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-qt-light
pkgver=0.95
pkgrel=4
pkgdesc="Chicken Scheme Egg: A leightweight Qt 4 interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/qt-light"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'chicken-protobj' 'chicken-matchable' 'chicken-miscmacros' 'qt')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=qt-light&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/qt-light.html")
md5sums=('735c7e13fa458367430f8df6dd800b6e' 'e147cfaac1736ab6a9fbdcaf61725242')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "qt-light-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "qt-light-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "qt-light-$pkgver/$fname"
		else
			dd iflag=fullblock of="qt-light-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/qt-light-$pkgver"
	cp ../$pkgname-$pkgver.html qt-light.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/qt-light"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "qt-light.html" "$pkgdir/usr/share/doc/$pkgname/qt-light.html"
}
