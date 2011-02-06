# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-hashes
pkgver=1.1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Miscellaneous Hash Functions"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/hashes"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper>=1.2.0' 'chicken-message-digest>=2.3.1' 'chicken-miscmacros>=2.91' 'chicken-moremacros>=1.1.1' 'chicken-box>=2.2.3' 'chicken-crc>=1.0.0' 'chicken-check-errors>=1.12.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=hashes&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/hashes.html")
md5sums=('1ea58044deb2d94c6d6dcc3965ea2156' '18869a7974b89c35df682b90b445abfd')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "hashes-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "hashes-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "hashes-$pkgver/$fname"
		else
			dd iflag=fullblock of="hashes-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/hashes-$pkgver"
	cp ../$pkgname-$pkgver.html hashes.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/hashes"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "hashes.html" "$pkgdir/usr/share/doc/$pkgname/hashes.html"
}
