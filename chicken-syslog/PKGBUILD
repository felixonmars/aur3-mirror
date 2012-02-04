# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-syslog
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Interface to the syslog-functions"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/syslog"
license=('MIT')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=syslog&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/syslog.html")
md5sums=('ab579548b17fdfb7591f000fd48ed0b1' '25dc04056411d966a4163b32b4b8e6e2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "syslog-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "syslog-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "syslog-$pkgver/$fname"
		else
			dd iflag=fullblock of="syslog-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/syslog-$pkgver"
	cp ../$pkgname-$pkgver.html syslog.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/syslog"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "syslog.html" "$pkgdir/usr/share/doc/$pkgname/syslog.html"
}
