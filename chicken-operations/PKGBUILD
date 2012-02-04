# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-operations
pkgver=0.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: The object system used in T"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/operations"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=operations&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/operations.html")
md5sums=('108cd32147c182e54657c832250ca507' '2fcd3c192ed671639ce4c7f2bbd7e0bc')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "operations-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "operations-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "operations-$pkgver/$fname"
		else
			dd iflag=fullblock of="operations-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/operations-$pkgver"
	cp ../$pkgname-$pkgver.html operations.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/operations"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "operations.html" "$pkgdir/usr/share/doc/$pkgname/operations.html"
}
