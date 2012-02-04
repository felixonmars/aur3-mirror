# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-ezxdisp
pkgver=2.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: A simple 2D and 3D graphics library for X11"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/ezxdisp"
license=('custom:LGPL-2')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'libx11')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=ezxdisp&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/ezxdisp.html")
md5sums=('4dece6b64943bc029aa5c6ab2b9db408' '01ced3d8fd3629832f3bfbef9d5c4e27')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "ezxdisp-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "ezxdisp-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "ezxdisp-$pkgver/$fname"
		else
			dd iflag=fullblock of="ezxdisp-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/ezxdisp-$pkgver"
	cp ../$pkgname-$pkgver.html ezxdisp.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/ezxdisp"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "ezxdisp.html" "$pkgdir/usr/share/doc/$pkgname/ezxdisp.html"
}
