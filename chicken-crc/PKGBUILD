# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-crc
pkgver=1.0.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Computes CRC checksum"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/crc"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=crc&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/crc.html")
md5sums=('06134b10bf57a8f156767978b78c6e17' 'dfa5091450e23f69511027beb6a75315')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "crc-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "crc-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "crc-$pkgver/$fname"
		else
			dd iflag=fullblock of="crc-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/crc-$pkgver"
	cp ../$pkgname-$pkgver.html crc.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/crc"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "crc.html" "$pkgdir/usr/share/doc/$pkgname/crc.html"
}
