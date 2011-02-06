# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-couchdb
pkgver=0.3.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Apache CouchDB client library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/couchdb"
license=('LGPL')
depends=('chicken>=4.5.0' 'chicken-http-client' 'chicken-intarweb' 'chicken-json' 'chicken-uri-common' 'chicken-defstruct' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=couchdb&version=$pkgver"
		)
md5sums=('dfc72c2714b61fcb08fac01995ebdfad')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "couchdb-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "couchdb-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "couchdb-$pkgver/$fname"
		else
			dd iflag=fullblock of="couchdb-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/couchdb-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/couchdb"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
