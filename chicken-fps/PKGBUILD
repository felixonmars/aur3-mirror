# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-fps
pkgver=1.1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Functional PostScript"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/fps"
license=('public')
depends=('chicken>=4.5.0' 'chicken-records' 'chicken-format' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=fps&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/fps.html")
md5sums=('d8f582dbf6e33a9affeda72cde4fa9c2' 'c3baf968e3e0db98ee57227b76e01fdd')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "fps-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "fps-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "fps-$pkgver/$fname"
		else
			dd iflag=fullblock of="fps-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/fps-$pkgver"
	cp ../$pkgname-$pkgver.html fps.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/fps"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "fps.html" "$pkgdir/usr/share/doc/$pkgname/fps.html"
}
