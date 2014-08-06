# Maintainer: Tom Richards <tom@tomrichards.net>

_nginxver=1.6.1
_passengerver=4.0.48

pkgname=nginx-passenger
pkgver=1.6.1
pkgrel=1
pkgdesc="HTTP Server with Passenger Module"
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'ruby' 'ruby-rack' 'curl')
optdepends=('python: Support for python web apps' 'nodejs: Support for node.js web apps')
conflicts=('nginx' 'passenger')
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
source=("http://nginx.org/download/nginx-$_nginxver.tar.gz"
    "https://github.com/phusion/passenger/archive/release-$_passengerver.tar.gz"
    'cleanup-headers.patch'
    'service'
    'logrotate')
sha256sums=('f5cfe682a1aeef4602c2ca705402d5049b748f946563f41d8256c18674836067'
            '3248ee613d8e3ed3aadce1d913bcd223f1ee0570280f291b9d16c3f1bf47f2f3'
            'ef8c92df29814a35f133ec5d9fef896f93709068aa3ca964b64aae68bdec2ab6'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            '272907d3213d69dac3bd6024d6d150caa23cb67d4f121e4171f34ba5581f9e98')

prepare() {
    cd "$srcdir/passenger-release-$_passengerver"
    patch -p1 < ../cleanup-headers.patch
}

build() {
    cd "$srcdir/passenger-release-$_passengerver"
    _nginx_addon_dir=`bin/passenger-config --nginx-addon-dir`

    cd "$srcdir/nginx-$_nginxver"
    export EXTRA_CFLAGS=$CFLAGS
    export EXTRA_CXXFLAGS=$CXXFLAGS

    ./configure \
        --prefix=/etc/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --sbin-path=/usr/bin/nginx \
        --pid-path=/run/nginx.pid \
        --lock-path=/run/lock/nginx.lock \
        --user=http \
        --group=http \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=stderr \
        --http-client-body-temp-path=/var/lib/nginx/client-body \
        --http-proxy-temp-path=/var/lib/nginx/proxy \
        --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
        --http-scgi-temp-path=/var/lib/nginx/scgi \
        --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
        --with-imap \
        --with-imap_ssl_module \
        --with-ipv6 \
        --with-pcre-jit \
        --with-file-aio \
        --with-http_dav_module \
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
        --add-module="$_nginx_addon_dir"
    make
}

package() {
    #Nginx
    cd "$srcdir/nginx-$_nginxver"
    make DESTDIR="$pkgdir/" install

    sed -e 's|\<user\s\+\w\+;|user html;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf
    rm "$pkgdir"/etc/nginx/*.default

    install -d "$pkgdir"/var/lib/nginx
    install -dm700 "$pkgdir"/var/lib/nginx/proxy

    chmod 750 "$pkgdir"/var/log/nginx
    chown http:log "$pkgdir"/var/log/nginx

    install -d "$pkgdir"/usr/share/nginx
    mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

    install -Dm644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/nginx
    install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/nginx.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rmdir "$pkgdir"/run

    install -Dm644 man/nginx.8 "$pkgdir"/usr/share/man/man8/nginx.8

    #Passenger
    cd "$srcdir/passenger-release-$_passengerver"

    #Passenger bin
    install -d "$pkgdir"/usr/lib/passenger/buildout
    rm -r $(find . -name "Makefile" -or -name "*.o")
    cp -R buildout/{agents,ruby} "$pkgdir"/usr/lib/passenger/buildout
    cp -R {bin,helper-scripts,lib,node_lib} "$pkgdir"/usr/lib/passenger/

    #Passenger native support
    install -d "$pkgdir"/usr/lib/passenger/ext
    cp -R ext/ruby "$pkgdir"/usr/lib/passenger/ext/

    #Passenger doc
    install -d "$pkgdir"/usr/share/doc/passenger
    cp -R doc "$pkgdir"/usr/share/doc/passenger/

    #Passenger man
    install -Dm644 man/passenger-config.1 "$pkgdir"/usr/share/man/man1/passenger-config.1
    install -Dm644 man/passenger-memory-stats.8 "$pkgdir"/usr/share/man/man8/passenger-memory-stats.8
    install -Dm644 man/passenger-status.8 "$pkgdir"/usr/share/man/man8/passenger-status.8
}
