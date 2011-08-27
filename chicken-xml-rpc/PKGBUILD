# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-xml-rpc
pkgver=2.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: XML-RPC client/server"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/xml-rpc"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-base64' 'chicken-http-client' 'chicken-intarweb' 'chicken-ssax' 'chicken-sxpath' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=xml-rpc&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/xml-rpc.html")
md5sums=('27e46d13c9ddc110712947adb86b91ec' '9d1888d9f6bd60506684cc39d97d098d')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "xml-rpc-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "xml-rpc-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "xml-rpc-$pkgver/$fname"
		else
			dd iflag=fullblock of="xml-rpc-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/xml-rpc-$pkgver"
	cp ../$pkgname-$pkgver.html xml-rpc.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/xml-rpc"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "xml-rpc.html" "$pkgdir/usr/share/doc/$pkgname/xml-rpc.html"
}
