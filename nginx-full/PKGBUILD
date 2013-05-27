# Maintainer: Simon Sickle <simon@simonsickle.com>
pkgname=nginx-full
pkgver=1.5.0
pkgrel=5
pkgdesc="lightweight HTTP server and IMAP/POP3 proxy server with standard, additional and 3d party modules"
arch=('i686' 'x86_64')
url="http://nginx.org"
license=('GPL')
depends=('pcre' 'zlib' 'openssl' 'pam' 'fakeroot' 'make' 'gd' 'libxslt')
provides=(nginx)
conflicts=('nginx' 'nginx-unstable' 'nginx-svn' 'nginx-devel' 'nginx-custom-dev')
replaces=()
backup=("etc/nginx/nginx.conf"
        "etc/nginx/mime.types"
        "etc/nginx/fastcgi.conf"
        "etc/nginx/fastcgi_params"
        "etc/nginx/php.conf")
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()

source=("http://nginx.org/download/nginx-$pkgver.tar.gz"
        "http://zlib.net/zlib-1.2.8.tar.gz"
        "https://github.com/downloads/masterzen/nginx-upload-progress-module/nginx_uploadprogress_module-0.9.0.tar.gz"
        "nginx.logrotate"
        "nginx.service"
        "nginx.conf")

md5sums=('f8f79f056a7a65b08ce40846e925182b'
         '44d667c142d7cda120332623eab69f40'
         '9dd5dc90990dbaea68881a14d4b6d9f3'
         '0b6b1b76550b1af8499a602be141322f'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '451914b457af898873eb9cba28b38e26')

build() {
        local _src_dir="${srcdir}/nginx-1.5.0"
        local _build_dir="${_src_dir}/objs"
        local _zlib_dir="zlib-1.2.8"
        local _uploadprogress_src="*-nginx-upload-progress-module-*"

        cd $_src_dir

        ./configure --prefix=/etc/nginx/ \
                    --sbin-path=/usr/bin/ \
                    --pid-path=/run/nginx.pid \
                    --error-log-path=/var/log/nginx/error-log \
                    --http-log-path=/var/log/nginx/http-log \
                    --conf-path=/etc/nginx/nginx.conf \
                    --user=http \
                    --group=http \
                    --with-zlib=${_src_dir}/../${_zlib_dir} \
                    --with-debug \
                    --with-ipv6 \
                    --with-imap \
                    --with-imap_ssl_module \
                    --with-http_ssl_module \
                    --with-http_spdy_module \
                    --with-http_stub_status_module \
                    --with-http_dav_module \
                    --with-http_addition_module \
                    --with-http_realip_module \
                    --with-http_xslt_module \
                    --with-http_image_filter_module \
                    --with-http_sub_module \
                    --with-http_degradation_module \
                    --with-http_perl_module \
                    --with-http_flv_module \
                    --with-http_gzip_static_module \
                    --with-http_mp4_module \
                    --with-http_random_index_module \
                    --with-http_secure_link_module \
                    --with-http_ssl_module \
                    --with-mail \
                    --with-mail_ssl_module \
                    --add-module=${_src_dir}/../${_uploadprogress_src}
        make
}

package() {            
            #Make standard directories
            mkdir -p $pkgdir/usr/bin/
            mkdir -p $pkgdir/etc/logrotate.d/
            mkdir -p $pkgdir/var/log/nginx/
            mkdir -p $pkgdir/var/www/default/
            mkdir -p $pkgdir/etc/nginx/sites-enabled/
            mkdir -p $pkgdir/etc/nginx/sites-available/

            #Create inital files for nginx to log to
            touch $pkgdir/var/log/nginx/error-log
            touch $pkgdir/var/log/nginx/http-log

            #The log directory should be 755
            chmod -R 755 $pkgdir/var/log/nginx/

            #Install to the pkgroot
            cd ${srcdir}/nginx-*
            make DESTDIR="$pkgdir/" install

            #Copy default html
            mv "${pkgdir}/etc/nginx/html/"* "${pkgdir}/var/www/default/"
            rm -rf "${pkgdir}/etc/nginx/html/"

            #Finally, install files
            install -D -m644 "${srcdir}/../nginx.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
            install -D -m644 "${srcdir}/../nginx.service" "${pkgdir}/lib/systemd/system/nginx.service"
            install -D -m644 "${srcdir}/../nginx.conf" "${pkgdir}/etc/nginx/nginx.conf"
            install -D -m644 "${srcdir}/nginx-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
            install -D -m644 "${srcdir}/nginx-$pkgver/man/nginx.8" "${pkgdir}/usr/share/man/man8/nginx.8"
}
