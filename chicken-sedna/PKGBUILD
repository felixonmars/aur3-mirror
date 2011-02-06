# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sedna
pkgver=3.3.55
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to the Sedna XML database management system."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sedna"
license=('custom:Apache')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sedna&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sedna.html")
md5sums=('640c090baea62563cbea3cbcabf61f10' '30ff53cdd51c0bf20edbcec7da4eb697')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sedna-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sedna-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sedna-$pkgver/$fname"
		else
			dd iflag=fullblock of="sedna-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sedna-$pkgver"
	cp ../$pkgname-$pkgver.html sedna.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sedna"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sedna.html" "$pkgdir/usr/share/doc/$pkgname/sedna.html"
}
