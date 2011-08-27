# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sdl
pkgver=0.5.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Basic SDL support"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sdl"
license=('LGPL')
depends=('chicken>=4.5.0'  'sdl_gfx' 'sdl_net' 'sdl_ttf' 'sdl_image')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sdl&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sdl.html")
md5sums=('51397229038fb5b628389c310d5d66cf' '98b8a5d05772b3f3e0e09ba741ff09cd')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sdl-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sdl-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sdl-$pkgver/$fname"
		else
			dd iflag=fullblock of="sdl-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sdl-$pkgver"
	cp ../$pkgname-$pkgver.html sdl.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sdl"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sdl.html" "$pkgdir/usr/share/doc/$pkgname/sdl.html"
}
