# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-interp1d
pkgver=1.11
pkgrel=4
pkgdesc="Chicken Scheme Egg: One-dimensional numerical interpolation."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/interp1d"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-easyffi' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=interp1d&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/interp1d.html")
md5sums=('78e389ed0eb09b71ee711cfd62ed253d' '536548a5cd289c989a29220bcfffa5c0')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "interp1d-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "interp1d-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "interp1d-$pkgver/$fname"
		else
			dd iflag=fullblock of="interp1d-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/interp1d-$pkgver"
	cp ../$pkgname-$pkgver.html interp1d.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/interp1d"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "interp1d.html" "$pkgdir/usr/share/doc/$pkgname/interp1d.html"
}
