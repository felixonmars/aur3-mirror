# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-uri-match
pkgver=0.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: A flexible URI matcher"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/uri-match"
license=('LGPL')
depends=('chicken>=4.5.0' 'chicken-uri-common' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=uri-match&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/uri-match.html")
md5sums=('85ca96e9caf38e53596c1784d0737d59' 'a48c0b2214f51af87b74562f46391d99')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "uri-match-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "uri-match-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "uri-match-$pkgver/$fname"
		else
			dd iflag=fullblock of="uri-match-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/uri-match-$pkgver"
	cp ../$pkgname-$pkgver.html uri-match.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/uri-match"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "uri-match.html" "$pkgdir/usr/share/doc/$pkgname/uri-match.html"
}
