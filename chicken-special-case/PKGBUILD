# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-special-case
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Optimizing Special Cases Abstractly"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/special-case"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=special-case&version=$pkgver"
		)
md5sums=('1c890f26ceccf581fd06ae91ed72357f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "special-case-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "special-case-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "special-case-$pkgver/$fname"
		else
			dd iflag=fullblock of="special-case-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/special-case-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/special-case"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
