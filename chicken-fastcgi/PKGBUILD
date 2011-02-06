# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-fastcgi
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Bindings for the FCGX API of libfcgi"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/fastcgi"
license=('BSD')
depends=('chicken>=4.5.0'  'fcgi')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=fastcgi&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/fastcgi.html")
md5sums=('a767e3d0af32b3d894b1a9cbb4b650bd' '645b32ace08b484f337603979bbdadf6')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "fastcgi-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "fastcgi-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "fastcgi-$pkgver/$fname"
		else
			dd iflag=fullblock of="fastcgi-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/fastcgi-$pkgver"
	cp ../$pkgname-$pkgver.html fastcgi.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/fastcgi"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "fastcgi.html" "$pkgdir/usr/share/doc/$pkgname/fastcgi.html"
}
