# Maintainer: cardiel <cardiel@vfemail.net>

_cfgdir=/etc/nginx
_tmpdir=/var/lib/nginx

pkgname=nginx-naxsi
pkgver=1.4.3
_naxsi_ver=0.50
pkgrel=1
pkgdesc="lightweight HTTP server and IMAP/POP3 proxy server, with Naxsi WAF"
arch=('i686' 'x86_64')
depends=('pcre' 'zlib' 'openssl')
makedepends=('git')
optdepends=('nx_util: Naxsi whitelist and reports generator')
url="http://nginx.org"
license=('custom')
backup=(${_cfgdir:1}/fastcgi.conf
	${_cfgdir:1}/fastcgi_params
	${_cfgdir:1}/koi-win
	${_cfgdir:1}/koi-utf
	${_cfgdir:1}/mime.types
	${_cfgdir:1}/nginx.conf
	${_cfgdir:1}/scgi_params
	${_cfgdir:1}/uwsgi_params
	${_cfgdir:1}/win-utf
	etc/logrotate.d/nginx)
source=("http://nginx.org/download/nginx-$pkgver.tar.gz"
        "https://naxsi.googlecode.com/files/naxsi-core-$_naxsi_ver.tgz")

md5sums=('4740dad2f0ed7f5fa16e8caaa8a9438e'
         '4693f8fae5abb2112c842c6dc4eb3316')

provides=('nginx')
conflicts=('nginx')
replaces=('nginx')

build() {
	cd "$srcdir/nginx-${pkgver}"

        ./configure \
        --prefix=$_cfgdir \
        --conf-path=$_cfgdir/nginx.conf \
        --sbin-path=/usr/sbin/nginx \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/lock/nginx.lock \
        --user=http --group=http \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --http-client-body-temp-path=$_tmpdir/client-body \
        --http-proxy-temp-path=$_tmpdir/proxy \
        --http-fastcgi-temp-path=$_tmpdir/fastcgi \
        --http-scgi-temp-path=$_tmpdir/scgi \
        --http-uwsgi-temp-path=$_tmpdir/uwsgi \
        --with-imap --with-imap_ssl_module \
        --with-file-aio \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_realip_module \
        --with-http_spdy_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
	--add-module=$srcdir/naxsi-core-$_naxsi_ver/naxsi_src \
        #--with-http_mp4_module \
        #--with-http_addition_module \
        #--with-http_xslt_module \
        #--with-http_image_filter_module \
        #--with-http_sub_module \
        #--with-http_flv_module \
        #--with-http_random_index_module \
        #--with-http_secure_link_module \
        #--with-http_degradation_module \
        #--with-http_perl_module \

	make
}

package() {
	cd "$srcdir/nginx-${pkgver}"
	make DESTDIR="$pkgdir" install

        sed -e 's|\<user\s\+\w\+;|user html;|g' \
	    -e '44s|html|/usr/share/nginx/html|' \
	    -e '54s|html|/usr/share/nginx/html|' \
	    -i "$pkgdir"/etc/nginx/nginx.conf
	rm "$pkgdir"/etc/nginx/*.default

	install -d "$pkgdir"/$_tmpdir
	install -dm700 "$pkgdir"/$_tmpdir/proxy

	chmod 750 "$pkgdir"/var/log/nginx
	chown http:log "$pkgdir"/var/log/nginx

	install -d "$pkgdir"/usr/share/nginx
	mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/nginx/LICENSE
	rm -rf "$pkgdir"/var/run

	install -Dm644 "$srcdir/naxsi-core-$_naxsi_ver/naxsi_config/naxsi_core.rules" "$pkgdir/etc/nginx/naxsi_core.rules"
	install -Dm644 "$srcdir/naxsi-core-$_naxsi_ver/naxsi_config/default_location_config.example" "$pkgdir/etc/nginx/default_location_config.example"
}
