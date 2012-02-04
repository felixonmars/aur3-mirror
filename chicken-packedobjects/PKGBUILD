# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-packedobjects
pkgver=0.77
pkgrel=4
pkgdesc="Chicken Scheme Egg: cross platform bit-stuffing based on Packed Encoding Rules"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/packedobjects"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=packedobjects&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/packedobjects.html")
md5sums=('3e9fc3d154fad5b207f2934c2629f3cf' '2f077fd33c903624d1b20d22048f61bf')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "packedobjects-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "packedobjects-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "packedobjects-$pkgver/$fname"
		else
			dd iflag=fullblock of="packedobjects-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/packedobjects-$pkgver"
	cp ../$pkgname-$pkgver.html packedobjects.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/packedobjects"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "packedobjects.html" "$pkgdir/usr/share/doc/$pkgname/packedobjects.html"
}
