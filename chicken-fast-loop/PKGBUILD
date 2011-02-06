# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-fast-loop
pkgver=0.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Fast extensible looping macros"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/fast-loop"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=fast-loop&version=$pkgver"
		)
md5sums=('34924652793dcf3687a870cf141ce86f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "fast-loop-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "fast-loop-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "fast-loop-$pkgver/$fname"
		else
			dd iflag=fullblock of="fast-loop-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/fast-loop-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/fast-loop"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
