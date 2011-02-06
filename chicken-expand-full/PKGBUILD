# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-expand-full
pkgver=1.0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Full macro expansion"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/expand-full"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=expand-full&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/expand-full.html")
md5sums=('552f73bb7a452008e958bd293f1ef230' 'aab379e2682534bde71bc81ab5aed5a2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "expand-full-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "expand-full-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "expand-full-$pkgver/$fname"
		else
			dd iflag=fullblock of="expand-full-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/expand-full-$pkgver"
	cp ../$pkgname-$pkgver.html expand-full.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/expand-full"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "expand-full.html" "$pkgdir/usr/share/doc/$pkgname/expand-full.html"
}
