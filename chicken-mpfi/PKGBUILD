# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mpfi
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Bindings for part of the MPFI interval arithmetic library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mpfi"
license=('BSD')
depends=('chicken>=4.5.0'  'mpfi>=1.5')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mpfi&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/mpfi.html")
md5sums=('bda8a077fd70fc14c3ac1e75f98fe300' '66bdc2c6a97b05f7ad86409adb03cd05')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "mpfi-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "mpfi-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "mpfi-$pkgver/$fname"
		else
			dd iflag=fullblock of="mpfi-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/mpfi-$pkgver"
	cp ../$pkgname-$pkgver.html mpfi.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/mpfi"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "mpfi.html" "$pkgdir/usr/share/doc/$pkgname/mpfi.html"
}
