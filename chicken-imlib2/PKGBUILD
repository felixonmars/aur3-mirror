# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-imlib2
pkgver=0.12
pkgrel=4
pkgdesc="Chicken Scheme Egg: Chicken bindings for the Imlib2 image library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/imlib2"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-foreigners' 'imlib2')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=imlib2&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/imlib2.html")
md5sums=('94aa84f1ac0cd4f140b37a2acff1b255' 'fda2c964efc89d24a1e0ad9f6d0b195e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "imlib2-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "imlib2-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "imlib2-$pkgver/$fname"
		else
			dd iflag=fullblock of="imlib2-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/imlib2-$pkgver"
	cp ../$pkgname-$pkgver.html imlib2.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/imlib2"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "imlib2.html" "$pkgdir/usr/share/doc/$pkgname/imlib2.html"
}
