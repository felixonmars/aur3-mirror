# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-3viewer
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: A simple 3D viewer"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/3viewer"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-defstruct' 'chicken-matchable' 'chicken-miscmacros' 'chicken-opengl' 'chicken-glut' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=3viewer&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/3viewer.html")
md5sums=('0729ac9301ae9f50aa8f4ed941c9acdc' '71bdd3a098829b52039a2433b61ac32d')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "3viewer-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "3viewer-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "3viewer-$pkgver/$fname"
		else
			dd iflag=fullblock of="3viewer-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/3viewer-$pkgver"
	cp ../$pkgname-$pkgver.html 3viewer.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/3viewer"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "3viewer.html" "$pkgdir/usr/share/doc/$pkgname/3viewer.html"
}
