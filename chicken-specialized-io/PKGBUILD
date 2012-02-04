# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-specialized-io
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Fast I/O procedures specialized for different types"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/specialized-io"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-numbers' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=specialized-io&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/specialized-io.html")
md5sums=('b1ce1d1b304bc831aee18af11cf0dda6' '31727e8fd00ee1e3f4687b0b6414be2c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "specialized-io-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "specialized-io-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "specialized-io-$pkgver/$fname"
		else
			dd iflag=fullblock of="specialized-io-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/specialized-io-$pkgver"
	cp ../$pkgname-$pkgver.html specialized-io.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/specialized-io"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "specialized-io.html" "$pkgdir/usr/share/doc/$pkgname/specialized-io.html"
}
