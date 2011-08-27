# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-loopy-loop
pkgver=0.5.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Alex Shinn's LOOP macro"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/loopy-loop"
license=('public')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=loopy-loop&version=$pkgver"
		)
md5sums=('43ec29aec2516ba64a2b0b6497657a9e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "loopy-loop-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "loopy-loop-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "loopy-loop-$pkgver/$fname"
		else
			dd iflag=fullblock of="loopy-loop-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/loopy-loop-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/loopy-loop"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
