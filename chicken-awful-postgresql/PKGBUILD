# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-awful-postgresql
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Postgresql support for awful"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/awful-postgresql"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-awful>=0.10' 'chicken-postgresql' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=awful-postgresql&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/awful-postgresql.html")
md5sums=('ff9c73d2dbe9b57dc4613ac2c325b48e' 'ba3ed3625c117f8dce7fc1188e1a6dc5')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "awful-postgresql-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "awful-postgresql-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "awful-postgresql-$pkgver/$fname"
		else
			dd iflag=fullblock of="awful-postgresql-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/awful-postgresql-$pkgver"
	cp ../$pkgname-$pkgver.html awful-postgresql.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/awful-postgresql"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "awful-postgresql.html" "$pkgdir/usr/share/doc/$pkgname/awful-postgresql.html"
}
