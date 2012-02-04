# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-dot-locking
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: advisory locking mechanism based on standard file operations"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/dot-locking"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=dot-locking&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/dot-locking.html")
md5sums=('ddc306bf23253d1a396eb943a43366f3' '1694628a3a6d83441c6792aac432dcf3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "dot-locking-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "dot-locking-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "dot-locking-$pkgver/$fname"
		else
			dd iflag=fullblock of="dot-locking-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/dot-locking-$pkgver"
	cp ../$pkgname-$pkgver.html dot-locking.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/dot-locking"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "dot-locking.html" "$pkgdir/usr/share/doc/$pkgname/dot-locking.html"
}
