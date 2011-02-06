# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-crunch
pkgver=0.7.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: A restricted statically typed subset of Scheme"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/crunch"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-miscmacros' 'chicken-defstruct' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=crunch&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/crunch.html")
md5sums=('5b84c18c5f12f7bcb2555fc3c8151cb9' '5caebcd647c0b10efded3c6d21094d61')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "crunch-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "crunch-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "crunch-$pkgver/$fname"
		else
			dd iflag=fullblock of="crunch-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/crunch-$pkgver"
	cp ../$pkgname-$pkgver.html crunch.html
	
	sed -r 's/make-pathname chicken-prefix/make-pathname (installation-prefix)/' -i.orig "crunch.setup"
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/crunch"
		mkdir -p "$pkgdir/usr/include"
	
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "crunch.html" "$pkgdir/usr/share/doc/$pkgname/crunch.html"
}
