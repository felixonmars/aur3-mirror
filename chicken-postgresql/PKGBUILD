# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-postgresql
pkgver=3.5.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Bindings for PostgreSQL's C-api"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/postgresql"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-sql-null' 'postgresql')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=postgresql&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/postgresql.html")
md5sums=('df1944a035e91b657819550673996b42' 'b53ed129446f884ae4e42ca13eee9144')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "postgresql-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "postgresql-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "postgresql-$pkgver/$fname"
		else
			dd iflag=fullblock of="postgresql-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/postgresql-$pkgver"
	cp ../$pkgname-$pkgver.html postgresql.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/postgresql"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "postgresql.html" "$pkgdir/usr/share/doc/$pkgname/postgresql.html"
}
