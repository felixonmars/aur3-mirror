# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=cherokee-svn
_origname=cherokee
pkgver=5966
pkgrel=1
pkgdesc="A very fast, flexible and easy to configure Web Server"
arch=('i686' 'x86_64')
url="http://www.cherokee-project.com/"
license=('GPL2')
depends=('openssl' 'pcre')
makedepends=('python2' 'gettext' 'subversion' 'libldap' 'pam' 'libmysqlclient'
             'ffmpeg' 'geoip')
optdepends=('python2: cherokee-admin (administrative web interface)'
            'libldap: ldap validator'
            'pam: pam validator'
            'libmysqlclient: mysql validator'
            'ffmpeg: Audio/Video streaming handler'
            'geoip: GeoIP rule module'
            'rrdtool: RRDtool based information collector')
provides=('cherokee')
conflicts=('cherokee')
backup=('etc/cherokee/cherokee.conf'
        'etc/logrotate.d/cherokee')
source=(cherokee.rc
        cherokee.logrotate)
options=('!libtool')
md5sums=('a2d2b69c6220fab57cda4f531b680f9f'
         '213069423f1c4a6abbb6e13a5b261bcf')

_svntrunk=svn://svn.cherokee-project.com/cherokee/trunk
_svnmod=cherokee

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # Use subdirectory for logs
  sed -i -r 's|(%localstatedir%/log)|\1/cherokee|' cherokee.conf.sample.pre

  # Use Python 2
  sed -i -e 's/env python$/\02/' \
         -e 's/python /python2 /' \
    admin/{server,upgrade_config}.py \
    doc/{Makefile.am,build/{asciidoc.py,build_web.sh}} \
    changelog-update.sh \
    po/admin/generate_POTFILESin.py \
    cherokee/Makefile.am

  # Use Python 2 in cherokee-admin
  sed -i 's/"python"/"python2"/' cherokee/main_admin.c

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --with-wwwroot=/srv/http --disable-static \
              --with-wwwuser=http --with-wwwgroup=http \
              --enable-os-string="Arch Linux"
  make
  make -j1 DESTDIR="$pkgdir" install

  # PAM configuration file for cherokee
  install -D -m644 pam.d_cherokee "$pkgdir/etc/pam.d/$pkgname"

  # Fix ownership of /var/lib/cherokee/graphs
  chown -R http:http "$pkgdir/var/lib/$_origname/graphs"

  # Compile Python scripts
  python2 -m compileall "$pkgdir"
  python2 -O -m compileall "$pkgdir"

  install -d -o http -g http "$pkgdir/var/log/$_origname"
  install -D "$srcdir/$_origname.rc" "$pkgdir/etc/rc.d/$_origname"
  install -Dm644 "$srcdir/$_origname.logrotate" "$pkgdir/etc/logrotate.d/$_origname"

  # Cleanup
  rm -rf "$pkgdir/srv"
}

# vim:set ts=2 sw=2 et:
