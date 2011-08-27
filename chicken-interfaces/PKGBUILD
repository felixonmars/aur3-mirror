# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-interfaces
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Simple interface/implementation abstraction"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/interfaces"
license=('public')
depends=('chicken>=4.5.0' 'chicken-records' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=interfaces&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/interfaces.html")
md5sums=('739792a851f693e404c05b111042bb57' '12a9e7afa2c967bc8400b6208660d785')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "interfaces-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "interfaces-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "interfaces-$pkgver/$fname"
		else
			dd iflag=fullblock of="interfaces-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/interfaces-$pkgver"
	cp ../$pkgname-$pkgver.html interfaces.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/interfaces"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "interfaces.html" "$pkgdir/usr/share/doc/$pkgname/interfaces.html"
}
