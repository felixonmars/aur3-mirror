# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mpd-client
pkgver=1.11
pkgrel=4
pkgdesc="Chicken Scheme Egg: Interface to Music Player Daemon"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mpd-client"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-eggdoc' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mpd-client&version=$pkgver"
		)
md5sums=('08b8a039aa424745e47430e52dc361b5')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "mpd-client-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "mpd-client-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "mpd-client-$pkgver/$fname"
		else
			dd iflag=fullblock of="mpd-client-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/mpd-client-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/mpd-client"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
