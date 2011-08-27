# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-free-gettext
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Binary-compatible flexible gettext reimplementation"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/free-gettext"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-charconv' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=free-gettext&version=$pkgver"
		)
md5sums=('1b5331735e12a9a080d33016927520df')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "free-gettext-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "free-gettext-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "free-gettext-$pkgver/$fname"
		else
			dd iflag=fullblock of="free-gettext-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/free-gettext-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/free-gettext"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
