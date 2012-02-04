# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mw-core
pkgver=0.2.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Core interface to Mediawiki API"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mw-core"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-uri-common>=0.9' 'chicken-intarweb>=0.1' 'chicken-http-client>=0.1' 'chicken-z3>=1.39' 'chicken-ssax>=5.0.2' 'chicken-sxpath>=0.1' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mw-core&version=$pkgver"
		)
md5sums=('099f69c90d44ace8385fc3794bd68d0a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "mw-core-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "mw-core-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "mw-core-$pkgver/$fname"
		else
			dd iflag=fullblock of="mw-core-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/mw-core-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/mw-core"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
