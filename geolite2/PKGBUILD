# Maintainer: felix (fstirlitz)
pkgbase=geolite2
pkgname=(
	geolite2-country
	geolite2-city
)
epoch=
pkgver=20140923
pkgrel=1
pkgdesc="MaxMind GeoLite2 GeoIP database - split package"
license=('CCPL:cc-by-sa-3.0')
arch=(any)
url="http://dev.maxmind.com/geoip/geoip2/downloadable/"
depends=()
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=()
sha512sums=()
noextract=()

_wanted() {
	for _item in "${pkgname[@]}"; do
		[[ "$_item" = "$1" ]] && return 0
	done
	return 1
}

if _wanted geolite2-country; then
	source+=("https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz")
	sha512sums+=('bae7762954f20b9a81ede59372f03faa28dd15413d957298d05e470011649a28810fa03fbc315bb49118b178c2ad33a59a31f731a4b311c4534324feec3e8142')
fi

if _wanted geolite2-city; then
	source+=("https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz")
	sha512sums+=('356e13f74a73bace736860dfdb58084e96afeb8a0f7d2e6db9e975718ccfe4838a7175bb0c60476e7b2fff0c6ad88936f2e0debde1d900c4447a75c3cd382bdd')
fi

build() {
	: # nothing needed
}

check() {
	cd "$srcdir"
	if _wanted geolite2-country; then
		msg2 "Validating the GeoLite2 Country database"
		echo "$(curl https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.md5) GeoLite2-Country.mmdb" | md5sum -c
	fi

	if _wanted geolite2-city; then
		msg2 "Validating the GeoLite2 City database"
		echo "$(curl https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.md5) GeoLite2-City.mmdb" | md5sum -c
	fi
}

package_geolite2-country() {
	pkgdesc="MaxMindDB GeoLite2 Country GeoIP database"

	cd "$srcdir"
	install -D -m0644 GeoLite2-Country.mmdb \
		"$pkgdir/usr/share/GeoIP/GeoLite2-Country.mmdb"
}

package_geolite2-city() {
	pkgdesc="MaxMindDB GeoLite2 City GeoIP database"

	cd "$srcdir"
	install -D -m0644 GeoLite2-City.mmdb \
		"$pkgdir/usr/share/GeoIP/GeoLite2-City.mmdb"
}
