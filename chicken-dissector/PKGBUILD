# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-dissector
pkgver=1.7.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: An object inspector for Chicken"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/dissector"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=dissector&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/dissector.html")
md5sums=('a7e6555f3680afdd2309fda7753b2781' '63e280b280f9799c6df80585d721bb50')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "dissector-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "dissector-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "dissector-$pkgver/$fname"
		else
			dd iflag=fullblock of="dissector-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/dissector-$pkgver"
	cp ../$pkgname-$pkgver.html dissector.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/dissector"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "dissector.html" "$pkgdir/usr/share/doc/$pkgname/dissector.html"
}
