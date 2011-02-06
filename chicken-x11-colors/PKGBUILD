# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-x11-colors
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: named standard colors as available in X11"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/x11-colors"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=x11-colors&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/x11-colors.html")
md5sums=('47e9dbf93e732cd3e5fe40cce4a92cc4' '0647a1e885912ee91bc70e915d85efc7')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "x11-colors-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "x11-colors-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "x11-colors-$pkgver/$fname"
		else
			dd iflag=fullblock of="x11-colors-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/x11-colors-$pkgver"
	cp ../$pkgname-$pkgver.html x11-colors.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/x11-colors"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "x11-colors.html" "$pkgdir/usr/share/doc/$pkgname/x11-colors.html"
}
