# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sassy
pkgver=0.2.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A portable 32-bit assembler for x86 processors"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sassy"
license=('LGPL')
depends=('chicken>=4.5.0' 'chicken-numbers' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sassy&version=$pkgver"
		)
md5sums=('2ee63e3b4b2f57fdaf1098b3f75b8676')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sassy-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sassy-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sassy-$pkgver/$fname"
		else
			dd iflag=fullblock of="sassy-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sassy-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sassy"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
