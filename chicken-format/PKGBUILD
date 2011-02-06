# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-format
pkgver=3.1.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: Common-Lisp style formatted output"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/format"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=format&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/format.html")
md5sums=('cde56d3641e3b4c56336c9ed6886687c' 'db1093997f7c84f3721c8a6418332a8b')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "format-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "format-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "format-$pkgver/$fname"
		else
			dd iflag=fullblock of="format-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/format-$pkgver"
	cp ../$pkgname-$pkgver.html format.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/format"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "format.html" "$pkgdir/usr/share/doc/$pkgname/format.html"
}
