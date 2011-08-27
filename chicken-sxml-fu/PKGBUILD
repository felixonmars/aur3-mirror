# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sxml-fu
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: SXML transformations ruleset library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sxml-fu"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-sxml-transforms' 'chicken-uri-common' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sxml-fu&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sxml-fu.html")
md5sums=('88b1dd37e4ca21508d1e8314787b996a' '977e8f0bb91ca0788694ce2833262ec6')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sxml-fu-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sxml-fu-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sxml-fu-$pkgver/$fname"
		else
			dd iflag=fullblock of="sxml-fu-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sxml-fu-$pkgver"
	cp ../$pkgname-$pkgver.html sxml-fu.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sxml-fu"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sxml-fu.html" "$pkgdir/usr/share/doc/$pkgname/sxml-fu.html"
}
