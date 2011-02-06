# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-phricken
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: An extensible Gopher server"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/phricken"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-gopher' 'chicken-uri-generic' 'chicken-tcp-server' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=phricken&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/phricken.html")
md5sums=('f92388ed01a48458f25d2c8473f8f2cf' '1178d60a510205cc0f5ec48c48cf383e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "phricken-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "phricken-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "phricken-$pkgver/$fname"
		else
			dd iflag=fullblock of="phricken-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/phricken-$pkgver"
	cp ../$pkgname-$pkgver.html phricken.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/phricken"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "phricken.html" "$pkgdir/usr/share/doc/$pkgname/phricken.html"
}
