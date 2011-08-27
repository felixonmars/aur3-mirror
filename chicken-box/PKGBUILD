# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-box
pkgver=2.2.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Boxing"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/box"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=box&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/box.html")
md5sums=('3041b5c420c83d26cfa05e85b5edd93d' '4493a32b958c8cc08fa0c03a8284dfb0')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "box-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "box-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "box-$pkgver/$fname"
		else
			dd iflag=fullblock of="box-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/box-$pkgver"
	cp ../$pkgname-$pkgver.html box.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/box"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "box.html" "$pkgdir/usr/share/doc/$pkgname/box.html"
}
