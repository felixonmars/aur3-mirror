# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-signal-diagram
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Signal function combinators."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/signal-diagram"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-datatype' 'chicken-mathh' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=signal-diagram&version=$pkgver"
		)
md5sums=('505ad7891fc7b730422008de15db6fe7')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "signal-diagram-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "signal-diagram-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "signal-diagram-$pkgver/$fname"
		else
			dd iflag=fullblock of="signal-diagram-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/signal-diagram-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/signal-diagram"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
