# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-tcp-server
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: A simple generic multithreaded tcp-server"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/tcp-server"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=tcp-server&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/tcp-server.html")
md5sums=('95a342b01292f7bd47abb6e0533402eb' 'd4aa27a77899228d45d832de313d366b')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "tcp-server-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "tcp-server-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "tcp-server-$pkgver/$fname"
		else
			dd iflag=fullblock of="tcp-server-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/tcp-server-$pkgver"
	cp ../$pkgname-$pkgver.html tcp-server.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/tcp-server"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "tcp-server.html" "$pkgdir/usr/share/doc/$pkgname/tcp-server.html"
}
