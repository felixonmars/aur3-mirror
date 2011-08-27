# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-autoload
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Load modules lazily"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/autoload"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=autoload&version=$pkgver"
		)
md5sums=('44f687b269ea88c4a764b75ea1cea94a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "autoload-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "autoload-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "autoload-$pkgver/$fname"
		else
			dd iflag=fullblock of="autoload-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/autoload-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/autoload"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
