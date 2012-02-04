# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-foof-loop
pkgver=8.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Extensible looping macros (originally based on Alex Shinn's)"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/foof-loop"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=foof-loop&version=$pkgver"
		)
md5sums=('fc363b9d661c06f930469cddba33de7b')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "foof-loop-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "foof-loop-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "foof-loop-$pkgver/$fname"
		else
			dd iflag=fullblock of="foof-loop-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/foof-loop-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/foof-loop"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
