# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-input-classes
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Type classes and transformer functions for input streams used by lexgen/abnf and related libraries."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/input-classes"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-typeclass' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=input-classes&version=$pkgver"
		)
md5sums=('a01eb4063aaf52c6287e5f40be2cece4')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "input-classes-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "input-classes-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "input-classes-$pkgver/$fname"
		else
			dd iflag=fullblock of="input-classes-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/input-classes-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/input-classes"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
