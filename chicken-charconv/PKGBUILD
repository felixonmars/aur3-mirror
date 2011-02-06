# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-charconv
pkgver=1.3.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Character encoding utilities"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/charconv"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-iconv' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=charconv&version=$pkgver"
		)
md5sums=('aff8a5760bd83e36b0ceac2e5a46b32a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "charconv-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "charconv-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "charconv-$pkgver/$fname"
		else
			dd iflag=fullblock of="charconv-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/charconv-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/charconv"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
