# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mbox
pkgver=2.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Routines for parsing Unix mbox files."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mbox"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-typeclass' 'chicken-input-classes' 'chicken-abnf' 'chicken-internet-message' 'chicken-internet-timestamp' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mbox&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/mbox.html")
md5sums=('d74f39f7e9f2f0206b9ac2d35502cc5d' '6b6a75c6c2be9d11c92f5b351871d4e8')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "mbox-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "mbox-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "mbox-$pkgver/$fname"
		else
			dd iflag=fullblock of="mbox-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/mbox-$pkgver"
	cp ../$pkgname-$pkgver.html mbox.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/mbox"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "mbox.html" "$pkgdir/usr/share/doc/$pkgname/mbox.html"
}
