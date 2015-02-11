# Maintainer: Mark Cornick <mcornick@mcornick.com>
# Contributor: archsim <myanomail123 AT gmail.com>
# Contributor: richiefrich <richiefrich AT penguinslair DOT org>
# Contributor: CRT <crt.011 AT gmail.com>
# Contributor: chiche <laguaza AT gmail.com>

pkgname=modsecurity-apache
_pkgname=modsecurity
pkgver=2.8.0
pkgrel=1
pkgdesc='ModSecurity web application firewall for Apache (and Nginx!) with Core Rule Set'
arch=('i686' 'x86_64')
depends=('apr' 'apr-util' 'pcre' 'libxml2' 'lua')
makedepends=('curl' 'git' 'apache')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
url="http://www.modsecurity.org"
license=('GPL2' 'Apache')
install=modsecurity.install

source=(http://www.modsecurity.org/tarball/${pkgver}/${_pkgname}-${pkgver}.tar.gz
        nginx.buildconfig
        modsecurity.tmpfiles)
sha256sums=('5cbbc7fc993d39106b653213753d25c4ec21771eee17b01b69122ccf3f73460e'
            'c2fa893eb30e64651f352a7a5bb7db64635661e3762d1353e023055db1e446c0'
            '019b4de90f2bd18cd624530de123f6f6c2ffa85e7dbb81bc91e435fb54666b47')


_gitrepo="git://github.com/SpiderLabs/owasp-modsecurity-crs.git"
_gitbase="crs"
_builddir="${_pkgname}-${pkgver}"

build() {
        msg "Building ModSecurity"

        cd "$_builddir"
        ./configure \
                --prefix=/usr \
                --libdir=/usr/lib/modsecurity \
                --includedir=/usr/include/modsecurity \
                --enable-standalone-module \
                --enable-extentions \
                --enable-alp2 \
                --enable-pcre-study \
                --enable-pcre-jit \
                --enable-lua-cache \
                --enable-performance-measurement
        ./configure \
                --prefix=/usr \
                --libdir=/usr/lib/modsecurity \
                --includedir=/usr/include/modsecurity \
                --disable-apache2-module \
                --enable-pcre-study \
                --enable-pcre-jit \
                --enable-lua-cache \
                --enable-performance-measurement
        make
        make -C standalone
        make -C alp2
        make -C ext
        make -C apache2
}

package() {
        cd "$_builddir"

        # Basics
        install -d -m0700 -o http -g http "$pkgdir"/run/modsecurity
        install -d -m0700 -o http -g http "$pkgdir"/var/lib/modsecurity
        install -Dm644 "$srcdir"/modsecurity.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/modsecurity.conf
        install -d -m0755 "$pkgdir"/usr/lib/modsecurity
        install -d -m0755 "$pkgdir"/usr/lib/modsecurity/ext
        install -d -m0755 "$pkgdir"/usr/include/modsecurity
        make DESTDIR="$pkgdir" install

        # Standalone module
        install -Dm755 standalone/.libs/*.a "$pkgdir"/usr/lib/modsecurity
        install -Dm755 standalone/.libs/*.so "$pkgdir"/usr/lib/modsecurity
        install -Dm644 standalone/*.h "$pkgdir"/usr/include/modsecurity

        # Audit Log Parser libs
        install -Dm755 alp2/.libs/*.a "$pkgdir"/usr/lib/modsecurity
        install -Dm755 alp2/.libs/*.so "$pkgdir"/usr/lib/modsecurity
        install -Dm644 alp2/*.h "$pkgdir"/usr/include/modsecurity

        # Apache modules
        install -d -m0755 "$pkgdir"/usr/lib/modsecurity/ext/apache2
        install -Dm755 apache2/.libs/*.so "$pkgdir"/usr/lib/modsecurity/ext/apache2
        install -Dm755 ext/.libs/*.so "$pkgdir"/usr/lib/modsecurity/ext/apache2

        # Nginx module
        install -d -m0755 "$pkgdir"/usr/lib/modsecurity/ext/nginx
        install -Dm644 nginx/modsecurity/ngx_http_modsecurity.c "$pkgdir"/usr/lib/modsecurity/ext/nginx
        install -Dm644 "$srcdir"/nginx.buildconfig "$pkgdir"/usr/lib/modsecurity/ext/nginx/config
        install -Dm644 apache2/*.h "$pkgdir"/usr/include/modsecurity
        install -Dm644 /usr/include/httpd/*.h "$pkgdir"/usr/include/modsecurity

        # Miscellaneous and documentation
        install -Dm644 mlogc/mlogc-default.conf "$pkgdir"/etc/modsecurity/mlogc.conf
        install -Dm644 tools/rules-updater-example.conf "$pkgdir"/etc/modsecurity/update.conf
        install -Dm644 modsecurity.conf-recommended "$pkgdir"/etc/modsecurity/modsecurity.conf-recommended
        install -Dm644 unicode.mapping "$pkgdir"/etc/modsecurity/unicode.mapping
        install -Dm644 mlogc/INSTALL "$pkgdir"/usr/share/doc/modsecurity/mlogc.txt
        install -Dm644 ext/README "$pkgdir"/usr/share/doc/modsecurity/extensions.txt
        install -Dm644 doc/README.txt "$pkgdir"/usr/share/doc/modsecurity/doc.txt
        install -Dm644 README.TXT "$pkgdir"/usr/share/doc/modsecurity/README.txt

        # Core Ruleset
        cd "$pkgdir"/etc/modsecurity
        msg "Retrieving current ModSecurity core ruleset"
        if [[ -d $_gitbase ]]; then
                cd $_gitbase && git pull origin
                msg "Local copy updated"
        else
                git clone $_gitrepo $_gitbase
                msg "Repository cloned"
        fi
}
