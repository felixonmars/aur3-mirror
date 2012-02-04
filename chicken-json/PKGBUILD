# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-json
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A JSON library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/json"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-packrat' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=json&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/json.html")
md5sums=('d8a4fc6251cfdbb6bb7959b139dbb5cd' '83f70f7ae31fb442bc877e6c13163f30')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "json-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "json-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "json-$pkgver/$fname"
		else
			dd iflag=fullblock of="json-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/json-$pkgver"
	cp ../$pkgname-$pkgver.html json.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/json"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "json.html" "$pkgdir/usr/share/doc/$pkgname/json.html"
}
