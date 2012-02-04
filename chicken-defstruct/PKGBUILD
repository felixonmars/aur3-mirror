# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-defstruct
pkgver=1.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: A more convenient form of define-record"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/defstruct"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=defstruct&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/defstruct.html")
md5sums=('5c1aba9050d51cd6759629f9a8b667c3' '5117451c12315e279b17cf11aab95837')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "defstruct-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "defstruct-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "defstruct-$pkgver/$fname"
		else
			dd iflag=fullblock of="defstruct-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/defstruct-$pkgver"
	cp ../$pkgname-$pkgver.html defstruct.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/defstruct"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "defstruct.html" "$pkgdir/usr/share/doc/$pkgname/defstruct.html"
}
