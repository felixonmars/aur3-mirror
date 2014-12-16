# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-nginx-passenger

_nginxver=1.6.2
_passengerver=4.0.55

pkgname=nginx-passenger
pkgver=1.6.2
pkgrel=3
pkgdesc="HTTP Server with Passenger Module"
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'ruby' 'ruby-rack' 'curl' 'libev')
optdepends=('python: Support for python web apps' 'nodejs: Support for node.js web apps')
makedepends=('hardening-wrapper')
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
install="${pkgname}.install"
source=("http://nginx.org/download/nginx-$_nginxver.tar.gz"
    "https://github.com/phusion/passenger/archive/release-$_passengerver.tar.gz"
    'cleanup-headers.patch'
    'service'
    'logrotate')
sha256sums=('b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18'
            'e1e2f6e278ef454b006dcdb3fd48c7f8327efd363fe2d8863d07823f27225e43'
            'ef8c92df29814a35f133ec5d9fef896f93709068aa3ca964b64aae68bdec2ab6'
            '6fe4c5eb7332f5eebdd7e08e46256a3d344bd375e9134be66013fbc52059e1ac'
            '272907d3213d69dac3bd6024d6d150caa23cb67d4f121e4171f34ba5581f9e98')

prepare() {
    cd "$srcdir/passenger-release-$_passengerver"
    patch -p1 < ../cleanup-headers.patch
}

build() {
    export USE_VENDORED_LIBEV=no
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
        --with-file-aio \
        --with-http_addition_module \
        --with-http_dav_module \
        --with-http_degradation_module \
        --with-http_flv_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_mp4_module \
        --with-http_realip_module \
        --with-http_secure_link_module \
        --with-http_spdy_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_sub_module \
        --with-imap \
        --with-imap_ssl_module \
        --with-ipv6 \
        --with-pcre-jit \
        --add-module="$_nginx_addon_dir"
    make
}

package() {
    #Nginx
    cd "$srcdir/nginx-$_nginxver"
    make DESTDIR="$pkgdir/" install

    install -Dm644 contrib/vim/ftdetect/nginx.vim "$pkgdir"/usr/share/vim/vimfiles/ftdetect/nginx.vim
    install -Dm644 contrib/vim/syntax/nginx.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/nginx.vim
    install -Dm644 contrib/vim/indent/nginx.vim "$pkgdir"/usr/share/vim/vimfiles/indent/nginx.vim

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
    cp -R {bin,helper-scripts,lib,node_lib,resources} "$pkgdir"/usr/lib/passenger/

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
