# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-chicken-doc-admin
pkgver=0.4.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Administer Chicken documentation locally"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/chicken-doc-admin"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-chicken-doc>=0.4.0' 'chicken-html-parser' 'chicken-sxml-transforms' 'chicken-svnwiki-sxml>=0.2.7' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=chicken-doc-admin&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/chicken-doc-admin.html")
md5sums=('6f3431f2f99463f9d4894d0320ce69c9' '24423d0a0d0a2b85cac7a3f517236218')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "chicken-doc-admin-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "chicken-doc-admin-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "chicken-doc-admin-$pkgver/$fname"
		else
			dd iflag=fullblock of="chicken-doc-admin-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/chicken-doc-admin-$pkgver"
	cp ../$pkgname-$pkgver.html chicken-doc-admin.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/chicken-doc-admin"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "chicken-doc-admin.html" "$pkgdir/usr/share/doc/$pkgname/chicken-doc-admin.html"
}
