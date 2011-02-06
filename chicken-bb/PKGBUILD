# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-bb
pkgver=1.27
pkgrel=4
pkgdesc="Chicken Scheme Egg: An easy-to-use GUI toolkit based on FLTK"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/bb"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-silex' 'chicken-easyffi' 'chicken-matchable' 'libjpeg' 'libpng' 'libxft' 'mesa' 'fltk' # 'flu'
	)
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=bb&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/bb.html")
md5sums=('6b37f9e80eb78a7a2989575a571b1d77' '0dd1edc869eaf3f892bf1ba151add316')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "bb-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "bb-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "bb-$pkgver/$fname"
		else
			dd iflag=fullblock of="bb-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/bb-$pkgver"
	cp ../$pkgname-$pkgver.html bb.html
	
	sed -r 's/^(#define widget_type\(x\) \(\()int\)/\1size_t)/' -i.orig bb-support.cpp 
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/bb"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "bb.html" "$pkgdir/usr/share/doc/$pkgname/bb.html"
}
