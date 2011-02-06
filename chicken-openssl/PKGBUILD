# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-openssl
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Bindings to the OpenSSL SSL/TLS library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/openssl"
license=('BSD')
depends=('chicken>=4.5.0'  'openssl')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=openssl&version=$pkgver"
		)
md5sums=('a1f5584aab03856378df2f51999e51b9')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "openssl-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "openssl-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "openssl-$pkgver/$fname"
		else
			dd iflag=fullblock of="openssl-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/openssl-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/openssl"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
