# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-hyde
pkgver=0.9
pkgrel=4
pkgdesc="Chicken Scheme Egg: A static website compiler"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/hyde"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-filepath' 'chicken-environments' 'chicken-sxml-transforms' 'chicken-doctype' 'chicken-matchable' 'chicken-scss' 'chicken-spiffy' 'chicken-colorize' 'chicken-intarweb' 'chicken-uri-common' 'chicken-svnwiki-sxml' 'chicken-defstruct' 'chicken-multidoc' 'chicken-atom' 'chicken-rfc3339' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=hyde&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/hyde.html")
md5sums=('7cae54f7a160528e70f52ee5766fe433' 'df21de0ab8af0ba23995bf02123bba2c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "hyde-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "hyde-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "hyde-$pkgver/$fname"
		else
			dd iflag=fullblock of="hyde-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/hyde-$pkgver"
	cp ../$pkgname-$pkgver.html hyde.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/hyde"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "hyde.html" "$pkgdir/usr/share/doc/$pkgname/hyde.html"
}
