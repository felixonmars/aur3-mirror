# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-freetype
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Freetype2 Interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/freetype"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-foreigners' 'chicken-matchable' 'freetype2')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=freetype&version=$pkgver"
		)
md5sums=('ae1d2092d1b305df69aed2fd0f27074e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "freetype-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "freetype-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "freetype-$pkgver/$fname"
		else
			dd iflag=fullblock of="freetype-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/freetype-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/freetype"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
