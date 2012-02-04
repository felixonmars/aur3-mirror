# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-svn-client
pkgver=0.15
pkgrel=4
pkgdesc="Chicken Scheme Egg: A wrapper around Subversion's libsvn_client C library."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/svn-client"
license=('public')
depends=('chicken>=4.5.0'  'subversion')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=svn-client&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/svn-client.html")
md5sums=('a6e61cdd2065b6d243dedb95d318d572' '18ecfc4dd1cd343fac6abeeb00127f56')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "svn-client-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "svn-client-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "svn-client-$pkgver/$fname"
		else
			dd iflag=fullblock of="svn-client-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/svn-client-$pkgver"
	cp ../$pkgname-$pkgver.html svn-client.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/svn-client"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "svn-client.html" "$pkgdir/usr/share/doc/$pkgname/svn-client.html"
}
