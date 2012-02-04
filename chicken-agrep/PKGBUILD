# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-agrep
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Approximate grep."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/agrep"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'chicken-datatype' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=agrep&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/agrep.html")
md5sums=('f54fea496e1483027706d401d83e0606' '2b918e0081a760ae13d175d8522e8134')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "agrep-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "agrep-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "agrep-$pkgver/$fname"
		else
			dd iflag=fullblock of="agrep-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/agrep-$pkgver"
	cp ../$pkgname-$pkgver.html agrep.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/agrep"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "agrep.html" "$pkgdir/usr/share/doc/$pkgname/agrep.html"
}
