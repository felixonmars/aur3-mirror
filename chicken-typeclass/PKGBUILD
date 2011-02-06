# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-typeclass
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Type classes"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/typeclass"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=typeclass&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/typeclass.html")
md5sums=('76ab373fe641446e2eb2b956086e36d9' '20c408142bb3c639f9236c8360f0be9c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "typeclass-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "typeclass-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "typeclass-$pkgver/$fname"
		else
			dd iflag=fullblock of="typeclass-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/typeclass-$pkgver"
	cp ../$pkgname-$pkgver.html typeclass.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/typeclass"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "typeclass.html" "$pkgdir/usr/share/doc/$pkgname/typeclass.html"
}
