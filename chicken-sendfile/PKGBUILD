# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sendfile
pkgver=1.7.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Sending a file over the network"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sendfile"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sendfile&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sendfile.html")
md5sums=('65da72e6df824eae2130b7f44541ae58' '5d7ec36a7f04eaf0e0d9526e76c550e4')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sendfile-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sendfile-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sendfile-$pkgver/$fname"
		else
			dd iflag=fullblock of="sendfile-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sendfile-$pkgver"
	cp ../$pkgname-$pkgver.html sendfile.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sendfile"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sendfile.html" "$pkgdir/usr/share/doc/$pkgname/sendfile.html"
}
