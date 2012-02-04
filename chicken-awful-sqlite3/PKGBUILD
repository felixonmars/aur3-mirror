# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-awful-sqlite3
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Sqlite3 support for awful"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/awful-sqlite3"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-awful>=0.10' 'chicken-sqlite3' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=awful-sqlite3&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/awful-sqlite3.html")
md5sums=('a952abf388beed31784963c9365a5319' '6bae396b69eccc94efd383dc086dab6c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "awful-sqlite3-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "awful-sqlite3-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "awful-sqlite3-$pkgver/$fname"
		else
			dd iflag=fullblock of="awful-sqlite3-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/awful-sqlite3-$pkgver"
	cp ../$pkgname-$pkgver.html awful-sqlite3.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/awful-sqlite3"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "awful-sqlite3.html" "$pkgdir/usr/share/doc/$pkgname/awful-sqlite3.html"
}
