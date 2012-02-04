# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-ioctl
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: ioctl system call interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/ioctl"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-foreigners' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=ioctl&version=$pkgver"
		)
md5sums=('927d3619fa1f25e47290058e9bc18045')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "ioctl-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "ioctl-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "ioctl-$pkgver/$fname"
		else
			dd iflag=fullblock of="ioctl-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/ioctl-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/ioctl"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
