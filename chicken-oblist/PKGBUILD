# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-oblist
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Obtain list of all interned symbols and variables"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/oblist"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=oblist&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/oblist.html")
md5sums=('e19079796c8894b01870e719a1b0378e' '266a04014f9f9e09fc0033c0d42c7d01')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "oblist-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "oblist-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "oblist-$pkgver/$fname"
		else
			dd iflag=fullblock of="oblist-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/oblist-$pkgver"
	cp ../$pkgname-$pkgver.html oblist.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/oblist"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "oblist.html" "$pkgdir/usr/share/doc/$pkgname/oblist.html"
}
