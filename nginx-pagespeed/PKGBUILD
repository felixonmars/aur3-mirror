# $Id$
# Maintainer:  Alexander Nestorov <alexandernst@gmail.com>
# Maintainer:  Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>
# nginx-pagespeed maintainer:  Ludovic Fauvet <etix@l0cal.com>

_cfgdir=/etc/nginx
_tmpdir=/var/lib/nginx
_logdir=/var/log/nginx

pkgname=nginx-pagespeed
_pkgname=nginx
pkgver=1.6.3
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server with ngx_pagespeed'
arch=('i686' 'x86_64')
depends=('pcre' 'zlib' 'openssl' 'geoip')
makedepends=('hardening-wrapper')
backup=('etc/nginx/fastcgi.conf'
        'etc/nginx/fastcgi_params'
        'etc/nginx/koi-win'
        'etc/nginx/koi-utf'
        'etc/nginx/mime.types'
        'etc/nginx/nginx.conf'
        'etc/nginx/scgi_params'
        'etc/nginx/uwsgi_params'
        'etc/nginx/win-utf'
        'etc/logrotate.d/nginx')
provides=('nginx')
conflicts=('nginx')
url="http://nginx.org"
license=('custom')

psver=1.9.32.3-beta
psolver=1.9.32.3

install=nginx.install
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
source=($url/download/nginx-$pkgver.tar.gz
		service
		logrotate
        https://github.com/pagespeed/ngx_pagespeed/archive/release-$psver.zip
        https://dl.google.com/dl/page-speed/psol/$psolver.tar.gz)
sha256sums=('0a98e95b366e4d6042f331e1fa4d70e18fd1e49d8993e589008e70e742b7e757'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            'bb85578a2d359fc9f77ca0b1f9e9941d9a424a76e766f16ddd6278c0fbbd7452'
            '5bf5f4689a0ae8db7fadd488be6d023e62660d516135131df4715f1ab525eb47'
            'b0aa65cd3a917c27b02b62d71582ffcf790639cbd73ae9d6e8374c5bc5fde9e2')

build() {
    ln -sf "$srcdir"/psol "$srcdir"/ngx_pagespeed-release*
	cd "$srcdir"/$_pkgname-$pkgver

	./configure \
        --prefix=$_cfgdir \
        --conf-path=$_cfgdir/nginx.conf \
        --sbin-path=/usr/bin/nginx \
        --pid-path=/run/nginx.pid \
        --lock-path=/run/lock/nginx.lock \
        --user=http \
        --group=http \
        --http-log-path=$_logdir/access.log \
        --error-log-path=$_logdir/error.log \
        --http-client-body-temp-path=$_tmpdir/client-body \
        --http-proxy-temp-path=$_tmpdir/proxy \
        --http-fastcgi-temp-path=$_tmpdir/fastcgi \
        --http-scgi-temp-path=$_tmpdir/scgi \
        --http-uwsgi-temp-path=$_tmpdir/uwsgi \
        --with-imap \
        --with-imap_ssl_module \
        --with-ipv6 \
        --with-pcre-jit \
        --with-file-aio \
        --with-http_dav_module \
        --with-http_geoip_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_realip_module \
        --with-http_spdy_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_addition_module \
        --with-http_degradation_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-http_secure_link_module \
        --with-http_sub_module \
        --add-module=../ngx_pagespeed-release-$psver \
        #--with-http_xslt_module \
        #--with-http_image_filter_module \
        #--with-http_random_index_module \
        #--with-http_perl_module \

	make -j$((`nproc` + 1))
}

package() {
	cd "$srcdir"/$_pkgname-$pkgver
	make DESTDIR="$pkgdir" install

	install -Dm644 contrib/vim/ftdetect/nginx.vim \
		"$pkgdir"/usr/share/vim/vimfiles/ftdetect/nginx.vim
	install -Dm644 contrib/vim/syntax/nginx.vim \
		"$pkgdir"/usr/share/vim/vimfiles/syntax/nginx.vim
	install -Dm644 contrib/vim/indent/nginx.vim \
		"$pkgdir"/usr/share/vim/vimfiles/indent/nginx.vim

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

	install -Dm644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/nginx
	install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/nginx.service
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nginx/LICENSE
	rm -rf "$pkgdir"/run

	install -d "$pkgdir"/usr/share/man/man8/
	gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz
}