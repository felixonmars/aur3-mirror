# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-html-utils
pkgver=0.6
pkgrel=4
pkgdesc="Chicken Scheme Egg: Procedures to ease the generation of some frequently used [X]HTML structures"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/html-utils"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-html-tags' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=html-utils&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/html-utils.html")
md5sums=('ffbd871d9b87b99a6a57ae8df04df296' '2a33c9145490bcb0f9f6d4e5a0036a73')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "html-utils-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "html-utils-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "html-utils-$pkgver/$fname"
		else
			dd iflag=fullblock of="html-utils-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/html-utils-$pkgver"
	cp ../$pkgname-$pkgver.html html-utils.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/html-utils"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "html-utils.html" "$pkgdir/usr/share/doc/$pkgname/html-utils.html"
}
