# Maintainer: Jonnathan Soares <jonnsl@hotmail.com>
# Contributor:  Jacek Burghardt           <jacek@hebe.us>
# Contributor:  Vojtech Aschenbrenner     <v@asch.cz>
# Contributor: Jason Gardner             <buhrietoe@gmail.com>
# Contributor: Ross melin                <rdmelin@gmail.com>
# Contributor (Parabola): Márcio Silva    <coadde@lavabit.com>
# Contributor (Parabola): André Silva    <emulatorman@lavabit.com>

# based of debian squeeze package

pkgbase=zoneminder-xinetd
pkgname=zoneminder-xinetd
pkgver=1.28.1
pkgrel=1
pkgdesc='Capture, analyse, record and monitor video security cameras (using xinetd for webservers without SCGI)'
arch=(
  i686
  x86_64
  mips64el
  arm
)
backup=(
  etc/zm.conf
)
url="https://github.com/ZoneMinder/ZoneMinder/releases/"
license=(
  GPL
)
depends=(
  gnutls
  mariadb
  perl-archive-zip
  perl-date-manip
  perl-dbd-mysql
  perl-dbi
  perl-expect
  perl-libwww
  perl-mime-lite
  perl-mime-tools
  perl-net-sftp-foreign
  perl-php-serialization
  perl-sys-mmap
  php
  php-gd
  php-mcrypt
  polkit
  xinetd
)
makedepends=(
  cmake
)
optdepends=(
  perl-time-modules
  perl-x10
  perl-astro-suntime
  'ffmpeg: Ffmpeg is used in exporting events to downloadable video files and as a source type for monitors.'
  'vlc: Used as a source type for monitors.'
)
install=zoneminder.install
source=(
  https://github.com/ZoneMinder/ZoneMinder/archive/v$pkgver.tar.gz
  zoneminder.service
  zms-inetd
  zms
)
sha512sums=(
  0ae29870e12b7ad0852510a17439df49dd35245aa1486a5d0ff71e17dbf89840d08c65b4485c93739f1fbcc253599162e28e0382c28927aa84cd734248587ea1
  ecc13e4a2e0d28c93fbcbd057c1a9f4bd63d89932e9dd2a73a0487601e98cf62026af38e0379e29aada5ee7dcfd9c67cead7c9d9d6db472651932c1fc2f60596
  ec68a4f5e9a8f994e32e10d654c330baaeab43f053a7c246ee1088d1c75d2936907b9e4623cb9e9c5c50e22eb801c13bfc774862d0730d9d185ec85ead193ae5
  a8dc5971d61d999e65f02cbe97a74826f57f8f7d69d52f0adce92ce7f5a749721d8d66daee7c5234aa612df49314c8ca33db3b19365a790f8aee6329b40f442f
)
build() {
  cd $srcdir/ZoneMinder-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/lib \
      -DZM_CGIDIR=/srv/http/cgi-bin \
      -DZM_WEBDIR=/srv/http/zoneminder \
      -DZM_WEB_USER=http \
      -DZM_CONTENTDIR=/var/cache/zoneminder \
      -DZM_LOGDIR=/var/log/zoneminder \
      -DZM_RUNDIR=/srv/zoneminder \
      -DZM_TMPDIR=/srv/zoneminder/tmp \
      -DZM_SOCKDIR=/srv/zoneminder/socks .
    
  make V=0
}

package() {
  cd $srcdir/ZoneMinder-$pkgver

  DESTDIR=$pkgdir make install

  mkdir -p $pkgdir/etc/xinetd.d
  mkdir -p $pkgdir/srv/http/{cgi-bin,zoneminder}
  mkdir -p $pkgdir/usr/{lib/systemd/system,share/{license/zoneminder,zoneminder/db}}
  mkdir -p $pkgdir/var/{cache/zoneminder,log/zoneminder}
  mkdir -p $pkgdir/srv/zoneminder/socks
  chown -R http.http $pkgdir/{etc/zm.conf,var/{cache/zoneminder,log/zoneminder}}
  chown -R http.http $pkgdir/srv/zoneminder/socks
  chmod 0600 $pkgdir/etc/zm.conf

  for i in events images temp; do
    mkdir                                       $pkgdir/var/cache/zoneminder/$i
    chown -v http.http                          $pkgdir/var/cache/zoneminder/$i
    ln -s /var/cache/zoneminder/$i              $pkgdir/srv/http/zoneminder/$i
    chown -v --no-dereference http.http         $pkgdir/srv/http/zoneminder/$i
  done

  ln -s /srv/http/cgi-bin                       $pkgdir/srv/http/zoneminder
  chown -h http.http                            $pkgdir/srv/http/{cgi-bin,zoneminder,zoneminder/cgi-bin}

  install -D -m 644 $srcdir/zoneminder.service  $pkgdir/usr/lib/systemd/system
  install -D -m 755 $srcdir/zms-inetd           $pkgdir/usr/bin
  install -D -m 644 $srcdir/zms                 $pkgdir/etc/xinetd.d
  install -D -m 644 COPYING                     $pkgdir/usr/share/license/zoneminder
  install -D -m 644 db/zm*.sql                  $pkgdir/usr/share/zoneminder/db
}
