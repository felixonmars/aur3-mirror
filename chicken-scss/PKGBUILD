# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-scss
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: An SCSS emitter with extensions"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/scss"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=scss&version=$pkgver"
		)
md5sums=('ea7b0ae1ea503e12db76ac81b4b67493')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "scss-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "scss-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "scss-$pkgver/$fname"
		else
			dd iflag=fullblock of="scss-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/scss-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/scss"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
