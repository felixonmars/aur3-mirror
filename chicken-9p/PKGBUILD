# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-9p
pkgver=0.8
pkgrel=4
pkgdesc="Chicken Scheme Egg: 9p networked filesystem protocol implementation.  Includes high-level client code library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/9p"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-iset' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=9p&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/9p.html")
md5sums=('2979d8305ee383a89bfe5274c359ec19' '0dc82b2e4acdd89e6a878eb27d2119e1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "9p-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "9p-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "9p-$pkgver/$fname"
		else
			dd iflag=fullblock of="9p-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/9p-$pkgver"
	cp ../$pkgname-$pkgver.html 9p.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/9p"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "9p.html" "$pkgdir/usr/share/doc/$pkgname/9p.html"
}
