# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-lzma
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A wrapper for the liblzma library, providing the excellent LZMA compression algorithm"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/lzma"
license=('BSD')
depends=('chicken>=4.5.0'  'xz')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=lzma&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/lzma.html")
md5sums=('05567e31442a8a1df5315f4c77de3138' 'ceccb71489a5345e11d5baad6853e757')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "lzma-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "lzma-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "lzma-$pkgver/$fname"
		else
			dd iflag=fullblock of="lzma-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/lzma-$pkgver"
	cp ../$pkgname-$pkgver.html lzma.html
		sed  -r 's=#include <lzmalib\.h>=#include <lzma.h>=' -i.orig lzma.scm

	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/lzma"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "lzma.html" "$pkgdir/usr/share/doc/$pkgname/lzma.html"
}
