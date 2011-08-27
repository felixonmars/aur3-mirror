# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-unix-sockets
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: UNIX domain sockets"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/unix-sockets"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=unix-sockets&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/unix-sockets.html")
md5sums=('41114810020c998af0720726e11d67f6' '9e9431f24de535554874fb854b6358e1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "unix-sockets-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "unix-sockets-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "unix-sockets-$pkgver/$fname"
		else
			dd iflag=fullblock of="unix-sockets-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/unix-sockets-$pkgver"
	cp ../$pkgname-$pkgver.html unix-sockets.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/unix-sockets"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "unix-sockets.html" "$pkgdir/usr/share/doc/$pkgname/unix-sockets.html"
}
