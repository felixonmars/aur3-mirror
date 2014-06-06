# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>
# Contributor: Andre Wayand <aur-davical@awayand.sleepmail.com>
# Contributor: <zenlord@gmail.com>
# Contributor: Michael Seiwald <michael@mseiwald.at>
pkgname=davical-git
pkgver=1.1.2.r89.gc32a288
pkgrel=1
pkgdesc="CalDAV CardDAV Server"
arch=('any')
url="http://davical.org/"
license=('GPL')
provides=('davical')
conflicts=('davical')
options=('!strip')
depends=('php>=5.1' 'awl>=0.53' 'php-pgsql' 'perl-dbd-pg' 'perl-yaml' 'perl-dbi')
optdepends=(
	'postgresql: Run postgresql locally'
	'apache: Web server to run davical'
	'nginx: Web server to run davical'
)
backup=(
	"etc/httpd/conf/extra/httpd-davical.conf"
	"etc/webapps/davical/localhost-conf.php"
)
install="davical.install"
changelog=ChangeLog
source=(
	"git+https://gitlab.com/davical-project/davical.git"
	httpd-davical.conf
	README.archlinux
)

pkgver() {
  cd "$srcdir/davical"
  git describe --long | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/davical"
  
  find -type f -exec sed -i "s%/etc/davical/%/etc/webapps/davical/%g" {} \;
}

package() {
  _instdir="$pkgdir/usr/share/webapps/davical"
  cd "${srcdir}/davical"
  
  mkdir -p "$_instdir" "$pkgdir/etc/webapps/davical"
  cp -ra . "$_instdir"

  install -D -m 0644 "config/example-config.php" "${pkgdir}/etc/webapps/davical/localhost-conf.php"
  install -D -m 0644 "${srcdir}/README.archlinux" "${_instdir}/README.archlinux"

  install -D -m 0644 "${srcdir}/httpd-davical.conf" "${pkgdir}/etc/httpd/conf/extra/httpd-davical.conf"
}

sha1sums=('SKIP'
          'a3d7860a6da5966d53b3e4b798c17d0d8785952b'
          '5040b5dfa278cf2a5b6a097a318a50086f55602a')
