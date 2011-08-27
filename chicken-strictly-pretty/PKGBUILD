# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-strictly-pretty
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Algebraic pretty printer."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/strictly-pretty"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-datatype' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=strictly-pretty&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/strictly-pretty.html")
md5sums=('7c3bd8891e047937b8944dfb896e4db3' '0dd1a247d94f7f1cf0fabc9100f59839')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "strictly-pretty-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "strictly-pretty-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "strictly-pretty-$pkgver/$fname"
		else
			dd iflag=fullblock of="strictly-pretty-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/strictly-pretty-$pkgver"
	cp ../$pkgname-$pkgver.html strictly-pretty.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/strictly-pretty"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "strictly-pretty.html" "$pkgdir/usr/share/doc/$pkgname/strictly-pretty.html"
}
