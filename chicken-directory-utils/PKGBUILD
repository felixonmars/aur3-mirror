# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-directory-utils
pkgver=1.0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: directory-utils"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/directory-utils"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-miscmacros>=2.91' 'chicken-list-utils>=1.0.0' 'chicken-stack>=2.1.1' 'chicken-check-errors>=1.11.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=directory-utils&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/directory-utils.html")
md5sums=('57e8acf010c8c60936050e5d12e0d15b' 'f216ed9528b67decf4de48bea091417e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "directory-utils-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "directory-utils-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "directory-utils-$pkgver/$fname"
		else
			dd iflag=fullblock of="directory-utils-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/directory-utils-$pkgver"
	cp ../$pkgname-$pkgver.html directory-utils.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/directory-utils"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "directory-utils.html" "$pkgdir/usr/share/doc/$pkgname/directory-utils.html"
}
