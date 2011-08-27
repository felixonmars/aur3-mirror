# This is a ZoneMinder PKGBUILD file. 
# Contributor: Ross melin <rdmelin@gmail.com>

pkgname=zoneminder-svn
pkgver=3066
pkgrel=1
pkgdesc="Capture, analyse, record and monitor video security cameras."
arch=('i686')
url="http://www.zoneminder.com"
license=('GPL')
groups=()
depends=('apache' 'php' 'mysql' 'pcre' 'openssl' 'ffmpeg' 'perl-php-serialization' 'perl-libwww' 'perl-date-manip' 'perl-unicode-map' 'perl-dbi' 'perl-dbd-mysql' 'perl-io-stringy' 'perl-mime-lite' 'perl-timedate' 'perl-x10' 'perl-time-modules' 'perl-net-smtp-ssl' 'perl-sys-mmap' 'sudo' 'libv4l')
makedepends=(subversion)
provides=(zoneminder)
conflicts=(zoneminder)
replaces=(zoneminder)
backup=(etc/zm.conf)
options=()
install=zoneminder.install
source=(zm.rc.d \
      zm.conf.patch \
      zmupdate.patch \
      Makefile.patch \
      zminit.arch \
      customdb \
      httpd-zm.conf \
      mootools.v1.11.js \
      zmfilter.pl \
      http://www.dynarch.com/static/jscalendar-1.0.zip \
      http://www.charliemouse.com:8080/code/cambozola/cambozola-0.50.tar.gz \
      zmeventbackup)
noextract=()
md5sums=('b20fb25b187eb6abb21321e153a7fb25'
         '1d2a4233af027452ae38a3e0b6d062ee'
         'e0732e7e8307281196daf5a3e99c854d'
         'b7b532b39f0985c2b995c7923728bc1b'
         'f9720872736f26d17bc49d8725b75ae4'
         '4ace13d1e20934abe192ef7372c75988'
         '00201eba9c0a5d1ed14b10cc55410698'
         '0df5bf23f9b09f0cae2e7f0a9e0ef16e'
         '73d1aec4cb2a8d72d752e9c332ceba78'
         '80c94ee5a11f5b79d70be328efde2582'
         'daded58688e16ab513920a54a0599267'
         '8b40137b6ff54f2fb26104b70edd22e9')
_svntrunk=http://svn.zoneminder.com/svn/zm/trunk
_svnmod=zm


build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd "$_svnmod-build"

	patch -p1 < ../zm.conf.patch || read
  patch -p1 < ../zmupdate.patch || read
  sed -i '60s/^$/$ENV{LD_PRELOAD} = "\/usr\/lib\/libv4l\/v4l1compat.so" ;/' \
  scripts/zmdc.pl.in || read
  sed -i '22s/^$/#include <cstdio>/' \
  src/zm_utils.cpp || read
  sed -i 's/$max_socket_tries = 3;/$max_socket_tries = 15;/' \
  web/ajax/stream.php || read
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-webuser=http  \
    --with-webgroup=http \
    --with-mysql=/usr  \
    --with-webdir=/var/lib/zm/www  \
    --with-cgidir=/var/lib/zm/cgi-bin \
    --bindir=/usr/lib/zm/bin \
    --enable-mmap=no \
    ZM_SSL_LIB=openssl \
    CPPFLAGS="-D__STDC_CONSTANT_MACROS"

  patch -p1 < ../Makefile.patch || read
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  install -D -m 700 $startdir/src/zminit.arch  $startdir/pkg/usr/lib/zm/bin/zminit
  install -D -m 700 $startdir/src/zm.rc.d  $startdir/pkg/etc/rc.d/zm
  install -D -m 700 scripts/zmdbbackup  $startdir/pkg/usr/lib/zm/bin/zmdbbackup
  install -D -m 700 scripts/zmdbbackup  $startdir/pkg/usr/lib/zm/bin/zmdbbackup
  install -D -m 700 scripts/zmdbrestore  $startdir/pkg/usr/lib/zm/bin/zmdbrestore
  install -D -m 700 scripts/zmeventdump  $startdir/pkg/usr/lib/zm/bin/zmeventdump
  install -D -m 700 scripts/zmlogrotate.conf  $startdir/pkg/etc/logrotate.d/zm
  install -D -m 700 $startdir/src/zmeventbackup  $startdir/pkg/etc/cron.hourly/zmeventbackup
  install -D -m 755 $startdir/src/zmfilter.pl $startdir/pkg/usr/lib/zm/bin/zmfilter.pl

  tar -zxf $startdir/src/cambozola-0.50.tar.gz 
  install -m 644  cambozola-0.50/dist/cambozola.jar $startdir/pkg/var/lib/zm/www/cambozola.jar
  
  mkdir -p  $startdir/pkg/etc/httpd/conf/extra/
  install -m 644 $startdir/src/httpd-zm.conf $startdir/pkg/etc/httpd/conf/extra/httpd-zm.conf
  
  mkdir -p $startdir/pkg/var/lib/zm/www/tools/mootools
  install $startdir/src/mootools.v1.11.js  $startdir/pkg/var/lib/zm/www/tools/mootools/mootools.js
  
  unzip  $startdir/src/jscalendar-1.0.zip
  mv $startdir/src/jscalendar-1.0 $startdir/pkg/var/lib/zm/www/tools/jscalendar

  install -D -m 700 $startdir/src/customdb $startdir/pkg/usr/lib/zm/upgrade/customdb
	install -D  db/zm*.sql $startdir/pkg/usr/lib/zm/upgrade/

  mkdir -p $startdir/pkg/var/run/zm

  ### remove special files
  find $startdir/pkg/ -name "perllocal.pod" \
    -o -name ".packlist"                \
    -o -name "*.bs"                     \
    |xargs -i rm -f {}

}

# vim:set ts=2 sw=2 et:
