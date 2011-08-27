# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-date-literals
pkgver=1.1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: A reader extension providing SRFI-19 date/time literals of the form <code>#@2007-12-31T23:59:59Z</code>"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/date-literals"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-srfi-19' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=date-literals&version=$pkgver"
		)
md5sums=('1793dce27457ce7f06e1f8c5b1bf2a2a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "date-literals-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "date-literals-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "date-literals-$pkgver/$fname"
		else
			dd iflag=fullblock of="date-literals-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/date-literals-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/date-literals"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
