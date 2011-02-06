# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-lazy-ffi
pkgver=1.8.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A foreign function interface for lazy programmers"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/lazy-ffi"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'libffi')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=lazy-ffi&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/lazy-ffi.html")
md5sums=('a40fa2b09f29a29253bf539e849ad673' 'cab47bdcc5a8ff228f33753daef7712a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "lazy-ffi-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "lazy-ffi-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "lazy-ffi-$pkgver/$fname"
		else
			dd iflag=fullblock of="lazy-ffi-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/lazy-ffi-$pkgver"
	cp ../$pkgname-$pkgver.html lazy-ffi.html
		export CSC_OPTIONS="$CSC_OPTIONS -I/usr/lib/libffi-3.0.9/include"

	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/lazy-ffi"
		export CSC_OPTIONS="$CSC_OPTIONS -I/usr/lib/libffi-3.0.9/include"
	
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "lazy-ffi.html" "$pkgdir/usr/share/doc/$pkgname/lazy-ffi.html"
}
