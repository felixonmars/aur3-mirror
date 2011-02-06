# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-vfs
pkgver=0.2.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: TinyCLOS wrappers for file operations"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/vfs"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-tinyclos' 'chicken-regex-case' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=vfs&version=$pkgver"
		)
md5sums=('4794aa3911913626b9ee04546d3506bc')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "vfs-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "vfs-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "vfs-$pkgver/$fname"
		else
			dd iflag=fullblock of="vfs-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/vfs-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/vfs"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
