# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-uri-dispatch
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Simple dispatch based on the supplied uri"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/uri-dispatch"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-uri-common' 'chicken-environments' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=uri-dispatch&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/uri-dispatch.html")
md5sums=('530aace13dff28b91deacb62d2bd8e36' '88fa31ff57e74dc5f40dcaec76e1fbc9')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "uri-dispatch-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "uri-dispatch-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "uri-dispatch-$pkgver/$fname"
		else
			dd iflag=fullblock of="uri-dispatch-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/uri-dispatch-$pkgver"
	cp ../$pkgname-$pkgver.html uri-dispatch.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/uri-dispatch"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "uri-dispatch.html" "$pkgdir/usr/share/doc/$pkgname/uri-dispatch.html"
}
