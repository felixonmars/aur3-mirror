# Maintainer: Isaac C. Aronson <i@pingas.org>
pkgbase=elsa
pkgname=elsa-common
true && pkgname=('elsa-common' 'elsa-web' 'elsa-node')
pkgver=333
pkgrel=2
pkgdesc="Enterprise Search Log and Archive"
arch=(any)
url="https://enterprise-log-search-and-archive.googlecode.com/"
license='GPL'
provides=()
makedepends=('subversion')
conflicts=()
replaces=()
options=('emptydirs')
source=('searchd' 'elsa.cron' 'elsa.logrotate')
BASE_DIR=/usr/share
DATA_DIR=/srv
md5sums=('958bdc6daa417399458b30941576f028'
         '5112d7013df794b162a47705ce251f23'
         'fb82e3af0b05be839613c51f28b1bb73')
_svntrunk="https://enterprise-log-search-and-archive.googlecode.com/svn/trunk"
_svnmod="elsa"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up)
  else
    svn co "$_svntrunk" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

}


package_elsa-common() {
  install -dm755 $pkgdir/$BASE_DIR/elsa
  cp -dpr --no-preserve=ownership $srcdir/elsa/elsa/contrib $pkgdir/$BASE_DIR/elsa/
  install -dm755 $pkgdir/$BASE_DIR/elsa/node/tmp/locks
  touch          $pkgdir/$BASE_DIR/elsa/node/tmp/locks/directory
  install -dm755 $pkgdir/$DATA_DIR/elsa/log 
}

package_elsa-node(){
  depends=('perl' 'curl' 'subversion' 'mysql' 'pcre' 'libpcap' 'openssl' 'libnet' 'perl-sys-meminfo' 'perl-time-hires' 'perl-cgi' 'perl-moose' 'perl-config-json' 'perl-string-crc32' 'perl-log-log4perl' 'perl-dbd-mysql' 'perl-date-manip' 'perl-moosex-traits' 'syslog-ng')
  install=elsa-node.install
  install -dm755 $pkgdir/$BASE_DIR/elsa
  cp -dpr --no-preserve=ownership $srcdir/elsa/elsa/node $pkgdir/$BASE_DIR/elsa
  install -dm755 $pkgdir/etc/elsa
  install -dm755 $pkgdir/$DATA_DIR/elsa/tmp/buffers/
  install -dm755 $pkgdir/$DATA_DIR/sphinx/log
  touch          $pkgdir/etc/sphinx_stopwords.txt
  install -Dm755 searchd $pkgdir/etc/rc.d/searchd
  install -dm755 $pkgdir/etc/elsa
  install -dm755 $pkgdir/usr/share/doc/elsa-node/
  cat "$srcdir/elsa/elsa/node/conf/syslog-ng.conf" | sed -e "s|\/usr\/local|$BASE_DIR|g" | sed -e "s|\/data|$DATA_DIR|g" > "$pkgdir/usr/share/doc/elsa-node/syslog-ng.etc.example"
  cat "$srcdir/elsa/elsa/node/conf/elsa.conf" | sed -e "s:/usr/local:$BASE_DIR:g" | sed -e "s:/data:$DATA_DIR:g" > $pkgdir/etc/elsa/elsa_node.conf
  chmod 644 $pkgdir/usr/share/doc/elsa-node/syslog-ng.etc.example
  chmod 644 $pkgdir/etc/elsa/elsa_node.conf
}

package_elsa-web() {
  depends=('curl' 'mysql' 'apache' 'pam' 'expat' 'mod_perl' 'perl-time-local' 'perl-time-hires' 'perl-moose' 'perl-config-json' 'perl-plack' 'perl-date-manip' 'perl-digest-sha1' 'perl-mime-base64' 'perl-uri-escape' 'perl-socket' 'perl-net-dns' 'perl-sys-hostname-fqdn' 'perl-string-crc32' 'perl-chi' 'perl-search-queryparser' 'perl-anyevent-dbi' 'perl-dbd-mysql' 'perl-ev' 'perl-sys-info' 'perl-sys-meminfo' 'perl-moosex-traits' 'perl-authen-simple' 'perl-authen-simple-pam' 'perl-authen-simple-dbi' 'perl-authen-simple-ldap' 'perl-net-ldap-express' 'perl-net-ldap-filterbuilder' 'perl-plack-middleware-crossorigin' 'perl-uri-escape' 'perl-module-pluggable' 'perl-module-install' 'perl-pdf-api2-simple' 'perl-xml-writer' 'perl-parse-snort' 'perl-spreadsheet-writeexcel' 'perl-io-string' 'perl-mailtools' 'perl-plack-middleware-static-minifier' 'perl-log-log4perl' 'perl-email-localdelivery' 'perl-plack-middleware-session' 'perl-sys-info' 'perl-chi-driver-dbi' 'perl-plack-builder-conditionals' 'perl-anyevent-http' 'perl-url-encode' 'perl-moosex-classattribute' 'perl-data-serializable' 'perl-moosex-log-log4perl' 'perl-authen-simple-dbi' 'perl-plack-middleware-nomultipleslashes' 'perl-moosex-storage' 'perl-moosex-clone' 'perl-authen-pam' 'perl-geo-ip')
  install -dm755 $pkgdir/$BASE_DIR/elsa
  cp -dpr --no-preserve=ownership $srcdir/elsa/elsa/web $pkgdir/$BASE_DIR/elsa
  install -dm755 $pkgdir/$DATA_DIR/elsa/log/
  touch          $pkgdir/$DATA_DIR/elsa/log/web.log
  install -dm755 $pkgdir/etc/elsa/
  cat "$srcdir/elsa/elsa/web/conf/elsa.conf" | sed -e "s:/usr/local:$BASE_DIR:g" | sed -e "s:/data:$DATA_DIR:g" > $pkgdir/etc/elsa/elsa_web.conf
  chmod 644 $pkgdir/etc/elsa/elsa_web.conf
  install -Dm755 elsa.cron $pkgdir/etc/cron.d/elsa.cron
  install -Dm755 elsa.logrotate $pkgdir/etc/logrotate.d/elsa
}

# vim:set ts=2 sw=2 et:

