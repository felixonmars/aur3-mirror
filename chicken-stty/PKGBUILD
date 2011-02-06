# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-stty
pkgver=0.2.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: stty-style interface to termios"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/stty"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-foreigners' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=stty&version=$pkgver"
		)
md5sums=('32e12e23fddeb17aa984c7e636f43407')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "stty-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "stty-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "stty-$pkgver/$fname"
		else
			dd iflag=fullblock of="stty-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/stty-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/stty"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
