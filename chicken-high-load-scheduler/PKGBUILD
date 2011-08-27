# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-high-load-scheduler
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: enhanced scheduler"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/high-load-scheduler"
license=('unknown')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=high-load-scheduler&version=$pkgver"
		)
md5sums=('1ac7141ecb5c2d7b62d8efcc6e651faa')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "high-load-scheduler-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "high-load-scheduler-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "high-load-scheduler-$pkgver/$fname"
		else
			dd iflag=fullblock of="high-load-scheduler-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/high-load-scheduler-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/high-load-scheduler"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
