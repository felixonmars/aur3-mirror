# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-epoll
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Support for epoll in Linux"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/epoll"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=epoll&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/epoll.html")
md5sums=('ea0de05a388382963c06fc3d9fdd951d' '991b98c01c391f3c1ceccaa7ddec9798')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "epoll-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "epoll-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "epoll-$pkgver/$fname"
		else
			dd iflag=fullblock of="epoll-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/epoll-$pkgver"
	cp ../$pkgname-$pkgver.html epoll.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/epoll"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "epoll.html" "$pkgdir/usr/share/doc/$pkgname/epoll.html"
}
