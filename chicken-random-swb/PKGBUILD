# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-random-swb
pkgver=1.12
pkgrel=4
pkgdesc="Chicken Scheme Egg: A random number generator based on the subtract-with-borrow (SWB) method."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/random-swb"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=random-swb&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/random-swb.html")
md5sums=('e068dda620a454a645f3458ddd456d25' '926d2525582492e3b2e9c2e423617280')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "random-swb-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "random-swb-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "random-swb-$pkgver/$fname"
		else
			dd iflag=fullblock of="random-swb-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/random-swb-$pkgver"
	cp ../$pkgname-$pkgver.html random-swb.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/random-swb"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "random-swb.html" "$pkgdir/usr/share/doc/$pkgname/random-swb.html"
}
