# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-heap-o-rama
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: ..."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/heap-o-rama"
license=('BSD')
depends=('chicken>=4.5.7'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=heap-o-rama&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/heap-o-rama.html")
md5sums=('3199308a2ca0fa29c910b295975b78c7' 'a2cb9f93330ba5afccc2b6a092af22ad')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "heap-o-rama-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "heap-o-rama-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "heap-o-rama-$pkgver/$fname"
		else
			dd iflag=fullblock of="heap-o-rama-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/heap-o-rama-$pkgver"
	cp ../$pkgname-$pkgver.html heap-o-rama.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/heap-o-rama"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "heap-o-rama.html" "$pkgdir/usr/share/doc/$pkgname/heap-o-rama.html"
}
