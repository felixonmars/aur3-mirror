# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-environments
pkgver=1.53
pkgrel=4
pkgdesc="Chicken Scheme Egg: User defined evaluation environments"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/environments"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=environments&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/environments.html")
md5sums=('8dbd275359185f00eaa4641ab58ce212' '4f2e825f72bd33dec2dc08ea4a97b532')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "environments-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "environments-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "environments-$pkgver/$fname"
		else
			dd iflag=fullblock of="environments-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/environments-$pkgver"
	cp ../$pkgname-$pkgver.html environments.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/environments"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "environments.html" "$pkgdir/usr/share/doc/$pkgname/environments.html"
}
