# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-95
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Sorting and merging"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-95"
license=('public')
depends=('chicken>=4.5.0' 'chicken-srfi-63' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-95&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-95.html")
md5sums=('618d58d909b0911a29fc8dd7f2a6de4f' 'e175886001620e07842fa94a7c379f23')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-95-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-95-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-95-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-95-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-95-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-95.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-95"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-95.html" "$pkgdir/usr/share/doc/$pkgname/srfi-95.html"
}
