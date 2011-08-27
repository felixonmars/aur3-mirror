# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-combinators
pkgver=1.2.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Combinators"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/combinators"
license=('public')
depends=('chicken>=4.5.0' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=combinators&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/combinators.html")
md5sums=('7c75e0789d968ee1f437e9c462fe9f54' '986fdf5c52242117d2634f3045211c7e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "combinators-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "combinators-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "combinators-$pkgver/$fname"
		else
			dd iflag=fullblock of="combinators-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/combinators-$pkgver"
	cp ../$pkgname-$pkgver.html combinators.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/combinators"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "combinators.html" "$pkgdir/usr/share/doc/$pkgname/combinators.html"
}
