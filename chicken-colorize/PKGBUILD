# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-colorize
pkgver=0.2.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Colorize programming code as HTML"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/colorize"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-defstruct' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=colorize&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/colorize.html")
md5sums=('d7d39b59b4b30e7835ad78cce1ccffe9' 'ccc8299041f1878731d4a0c92e38ced3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "colorize-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "colorize-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "colorize-$pkgver/$fname"
		else
			dd iflag=fullblock of="colorize-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/colorize-$pkgver"
	cp ../$pkgname-$pkgver.html colorize.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/colorize"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "colorize.html" "$pkgdir/usr/share/doc/$pkgname/colorize.html"
}
