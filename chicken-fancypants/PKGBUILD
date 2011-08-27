# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-fancypants
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Automatic ASCII smart quotes and ligature handling for SXML"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/fancypants"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=fancypants&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/fancypants.html")
md5sums=('799204270ebbc0df8b92f5f7d115a377' '7feee8697e04e28447c643b3f641e524')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "fancypants-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "fancypants-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "fancypants-$pkgver/$fname"
		else
			dd iflag=fullblock of="fancypants-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/fancypants-$pkgver"
	cp ../$pkgname-$pkgver.html fancypants.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/fancypants"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "fancypants.html" "$pkgdir/usr/share/doc/$pkgname/fancypants.html"
}
