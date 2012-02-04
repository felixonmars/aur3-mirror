# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sigma
pkgver=2.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: An image gallery generator."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sigma"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-sxml-transforms' 'chicken-utf8' 'chicken-uri-generic' 'chicken-fmt' 'chicken-getopt-long' 'chicken-setup-helper')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sigma&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sigma.html")
md5sums=('6db1a8529e7e23f780913a03533fb614' '00a56f92f932a3ddb836dc443c396bf0')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sigma-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sigma-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sigma-$pkgver/$fname"
		else
			dd iflag=fullblock of="sigma-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sigma-$pkgver"
	cp ../$pkgname-$pkgver.html sigma.html
	
	
	sed -r '/define SHARED-DIR \(chicken-home\)/ { s//define SHARED-DIR (installation-chicken-home)/; i (include "setup-helper")
}' -i.orig "sigma.setup"
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sigma"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sigma.html" "$pkgdir/usr/share/doc/$pkgname/sigma.html"
}
