# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-breadcrumbs
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Breadcrumbs for web pages"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/breadcrumbs"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=breadcrumbs&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/breadcrumbs.html")
md5sums=('c46f92ddce13893b848aa976e656bf34' '9d958c2849c30fec1ac65b8b18bb22da')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "breadcrumbs-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "breadcrumbs-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "breadcrumbs-$pkgver/$fname"
		else
			dd iflag=fullblock of="breadcrumbs-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/breadcrumbs-$pkgver"
	cp ../$pkgname-$pkgver.html breadcrumbs.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/breadcrumbs"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "breadcrumbs.html" "$pkgdir/usr/share/doc/$pkgname/breadcrumbs.html"
}
