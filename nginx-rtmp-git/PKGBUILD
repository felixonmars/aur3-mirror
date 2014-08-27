# Original nginx PKGBUILD:
# Maintainer:  Terry Zink <bezerker@bezerker.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <barthalion@gmal.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>
# nginx-rtmp-git PKGBUILD:

_cfgdir=/etc/nginx
_tmpdir=/var/lib/nginx

pkgname=nginx-rtmp-git
pkgver=20140213
_ngxver=1.6.1
pkgrel=1
pkgdesc="nginx HTTP server with rtmp module"
arch=('i686' 'x86_64')
depends=('pcre' 'zlib' 'openssl')
makedepends=('passenger' 'git')
optdepends=('passenger')
conflicts=('nginx')
provides=('nginx')
url="http://nginx.org"
license=('custom')
#install=nginx.install
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
source=(http://nginx.org/download/nginx-$_ngxver.tar.gz
		service
		logrotate
)
md5sums=('45e5a11f48b001644676f7767980a2bf'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '3441ce77cdd1aab6f0ab7e212698a8a7')

         
_gitroot="https://github.com/arut/nginx-rtmp-module.git"
_gitname="nginx-rtmp-module"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir"/nginx-$_ngxver

	./configure \
        --prefix=$_cfgdir \
        --conf-path=$_cfgdir/nginx.conf \
        --sbin-path=/usr/bin/nginx \
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
        --with-ipv6 --with-pcre-jit \
        --with-file-aio \
        --with-http_dav_module \
        --with-http_gzip_static_module \
        --with-http_realip_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --add-module=/usr/lib/passenger/ext/nginx \
        --add-module=$srcdir/$_gitname-build \
        #--with-http_mp4_module \
        #--with-http_realip_module \
        #--with-http_addition_module \
        #--with-http_xslt_module \
        #--with-http_image_filter_module \
        #--with-http_geoip_module \
        #--with-http_sub_module \
        #--with-http_flv_module \
        #--with-http_random_index_module \
        #--with-http_secure_link_module \
        #--with-http_degradation_module \
        #--with-http_perl_module \

	make
}

package() {
	cd "$srcdir"/nginx-$_ngxver
	make DESTDIR="$pkgdir" install

	install -d "$pkgdir"/etc/logrotate.d
	install -m644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/nginx

	sed -e 's|\<user\s\+\w\+;|user html;|g' \
		-e '44s|html|/usr/share/nginx/html|' \
		-e '54s|html|/usr/share/nginx/html|' \
		-i "$pkgdir"/etc/nginx/nginx.conf
	rm "$pkgdir"/etc/nginx/*.default

	install -d "$pkgdir"/$_tmpdir

	install -d "$pkgdir"/usr/share/nginx
	mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

	install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/nginx.service
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/nginx/LICENSE
	rm -rf "$pkgdir"/var/run
}
