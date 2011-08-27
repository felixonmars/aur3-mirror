# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-endian-port
pkgver=3.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: An I/O port that supports different endian formats."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/endian-port"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-eggdoc' 'chicken-iset' 'chicken-endian-blob' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=endian-port&version=$pkgver"
		)
md5sums=('57d39090165da9ffa6039f28b4207b1c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "endian-port-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "endian-port-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "endian-port-$pkgver/$fname"
		else
			dd iflag=fullblock of="endian-port-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/endian-port-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/endian-port"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
