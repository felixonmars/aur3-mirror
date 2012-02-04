# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-prometheus
pkgver=2.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: The Prometheus prototype-based object system"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/prometheus"
license=('GPL')
depends=('chicken>=4.5.0' 'chicken-s48-modules>=0.3' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=prometheus&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/prometheus.html")
md5sums=('b070c39b60d938e1196fe38b3f13d823' 'ad459a005a7017c37a4a8f4c37459452')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "prometheus-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "prometheus-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "prometheus-$pkgver/$fname"
		else
			dd iflag=fullblock of="prometheus-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/prometheus-$pkgver"
	cp ../$pkgname-$pkgver.html prometheus.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/prometheus"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "prometheus.html" "$pkgdir/usr/share/doc/$pkgname/prometheus.html"
}
