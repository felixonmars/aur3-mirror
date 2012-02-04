# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-pyffi
pkgver=2.17
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to the Python programming language."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/pyffi"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'chicken-utf8' 'python')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=pyffi&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/pyffi.html")
md5sums=('a231aa0dc57e3ba150dd03a2bbe6cf41' 'd01f6e3dad02269e54d165c86cdbb8e0')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "pyffi-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "pyffi-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "pyffi-$pkgver/$fname"
		else
			dd iflag=fullblock of="pyffi-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/pyffi-$pkgver"
	cp ../$pkgname-$pkgver.html pyffi.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/pyffi"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "pyffi.html" "$pkgdir/usr/share/doc/$pkgname/pyffi.html"
}
