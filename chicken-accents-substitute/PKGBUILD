# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-accents-substitute
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Substitute accented characters in strings"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/accents-substitute"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=accents-substitute&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/accents-substitute.html")
md5sums=('45ba9355a016afa3acdcbf27a7a99035' '1a7d7933f59012fc1a47981ceac65eb3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "accents-substitute-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "accents-substitute-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "accents-substitute-$pkgver/$fname"
		else
			dd iflag=fullblock of="accents-substitute-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/accents-substitute-$pkgver"
	cp ../$pkgname-$pkgver.html accents-substitute.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/accents-substitute"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "accents-substitute.html" "$pkgdir/usr/share/doc/$pkgname/accents-substitute.html"
}
