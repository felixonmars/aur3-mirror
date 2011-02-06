# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-ssax
pkgver=5.0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Oleg Kiselyov's XML parser"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/ssax"
license=('public')
depends=('chicken>=4.5.0' 'chicken-input-parse' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=ssax&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/ssax.html")
md5sums=('a087c4dfc7250c8a6fa7960febcf36da' 'c4b7f6fdde60496ddedff0398f5071a3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "ssax-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "ssax-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "ssax-$pkgver/$fname"
		else
			dd iflag=fullblock of="ssax-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/ssax-$pkgver"
	cp ../$pkgname-$pkgver.html ssax.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/ssax"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "ssax.html" "$pkgdir/usr/share/doc/$pkgname/ssax.html"
}
