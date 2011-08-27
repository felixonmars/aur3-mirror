# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-char-set-literals
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: A reader extension providing Gauche style literals for SRFI-14 char-sets"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/char-set-literals"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=char-set-literals&version=$pkgver"
		)
md5sums=('77a4d284c6a73c28f0ec9dcfcd3af100')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "char-set-literals-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "char-set-literals-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "char-set-literals-$pkgver/$fname"
		else
			dd iflag=fullblock of="char-set-literals-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/char-set-literals-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/char-set-literals"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
