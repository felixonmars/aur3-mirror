# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-couchdb-view-server
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: A Scheme view server for Apache CouchDB"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/couchdb-view-server"
license=('LGPL')
depends=('chicken>=4.5.0' 'chicken-json' 'chicken-environments' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=couchdb-view-server&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/couchdb-view-server.html")
md5sums=('8b2c6d2b707ecd8e197589d645d1a682' '35287be2baccd3c77eb6fdebdb7c9726')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "couchdb-view-server-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "couchdb-view-server-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "couchdb-view-server-$pkgver/$fname"
		else
			dd iflag=fullblock of="couchdb-view-server-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/couchdb-view-server-$pkgver"
	cp ../$pkgname-$pkgver.html couchdb-view-server.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/couchdb-view-server"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "couchdb-view-server.html" "$pkgdir/usr/share/doc/$pkgname/couchdb-view-server.html"
}
