# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-rpc
pkgver=1.1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: A flexible peer-to-peer RPC system."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/rpc"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-tcp-server' 'chicken-s11n' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=rpc&version=$pkgver"
		)
md5sums=('6a1fd463b78305bea9cf52eec0095f30')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "rpc-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "rpc-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "rpc-$pkgver/$fname"
		else
			dd iflag=fullblock of="rpc-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/rpc-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/rpc"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
