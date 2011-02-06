# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-udp
pkgver=1.14
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to User Datagram Protocol sockets"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/udp"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=udp&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/udp.html")
md5sums=('a3f368dc5da5c6f08b4107ff7ca23ebe' '56d03d0357bf954d4135bf500cf38f92')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "udp-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "udp-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "udp-$pkgver/$fname"
		else
			dd iflag=fullblock of="udp-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/udp-$pkgver"
	cp ../$pkgname-$pkgver.html udp.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/udp"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "udp.html" "$pkgdir/usr/share/doc/$pkgname/udp.html"
}
