# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-advice
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: 'advise' functionality"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/advice"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=advice&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/advice.html")
md5sums=('61c58ae220aaa846546ac85374fb843a' '6d168642932babe1beedc75585723fb4')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "advice-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "advice-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "advice-$pkgver/$fname"
		else
			dd iflag=fullblock of="advice-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/advice-$pkgver"
	cp ../$pkgname-$pkgver.html advice.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/advice"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "advice.html" "$pkgdir/usr/share/doc/$pkgname/advice.html"
}
