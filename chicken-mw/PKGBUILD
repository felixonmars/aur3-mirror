# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mw
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Expanded Mediawiki API interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mw"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-uri-common' 'chicken-intarweb' 'chicken-http-client' 'chicken-z3' 'chicken-ssax' 'chicken-sxpath>=0.1' 'chicken-mw-core>=0.2' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mw&version=$pkgver"
		)
md5sums=('0c87fcb3ab01e7cbe7f971c7d1ce1ac0')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "mw-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "mw-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "mw-$pkgver/$fname"
		else
			dd iflag=fullblock of="mw-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/mw-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/mw"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
