# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-tinyclos-xerox
pkgver=0.0.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Experimental copy of the original Xerox PARC copy of tiny-clos"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/tinyclos-xerox"
license=('custom:XEROX')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=tinyclos-xerox&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/tinyclos-xerox.html")
md5sums=('f66e7b098ed1c61defcc9882779dc777' 'b8ab4e2c3896e49963f1aaf5006651e3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "tinyclos-xerox-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "tinyclos-xerox-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "tinyclos-xerox-$pkgver/$fname"
		else
			dd iflag=fullblock of="tinyclos-xerox-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/tinyclos-xerox-$pkgver"
	cp ../$pkgname-$pkgver.html tinyclos-xerox.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/tinyclos-xerox"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "tinyclos-xerox.html" "$pkgdir/usr/share/doc/$pkgname/tinyclos-xerox.html"
}
