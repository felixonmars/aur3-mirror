# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-hostinfo
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Look up host, protocol, and service information"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/hostinfo"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-vector-lib' 'chicken-foreigners' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=hostinfo&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/hostinfo.html")
md5sums=('2518ba799cef6718d317f1c9ee810d28' '232ed70aad0906ed60d4ec096a018865')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "hostinfo-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "hostinfo-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "hostinfo-$pkgver/$fname"
		else
			dd iflag=fullblock of="hostinfo-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/hostinfo-$pkgver"
	cp ../$pkgname-$pkgver.html hostinfo.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/hostinfo"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "hostinfo.html" "$pkgdir/usr/share/doc/$pkgname/hostinfo.html"
}
