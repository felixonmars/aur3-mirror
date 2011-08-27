# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-xosd
pkgver=1.6
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to the XOSD (On Screen Display) library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/xosd"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'xosd')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=xosd&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/xosd.html")
md5sums=('d42805ac4a656f63f64bf939d18a2ba6' '1d5d96bf4b7aa46c43dc0c824bd11d1b')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "xosd-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "xosd-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "xosd-$pkgver/$fname"
		else
			dd iflag=fullblock of="xosd-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/xosd-$pkgver"
	cp ../$pkgname-$pkgver.html xosd.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/xosd"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "xosd.html" "$pkgdir/usr/share/doc/$pkgname/xosd.html"
}
