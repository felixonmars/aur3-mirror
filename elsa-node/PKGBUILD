# Maintainer: Isaac C. Aronson <i@pingas.org>
pkgname=elsa-node
pkgver=326
pkgrel=1
pkgdesc="Enterprise Search Log and Archive (Node)"
arch=(any)
url="https://enterprise-log-search-and-archive.googlecode.com/"
license='GPL'
depends=('perl' 'curl' 'subversion' 'mysql' 'pcre' 'libpcap' 'openssl' 'libnet' 'perl-sys-meminfo' 'perl-time-hires' 'perl-cgi' 'perl-moose' 'perl-config-json' 'perl-string-crc32' 'perl-log-log4perl' 'perl-dbd-mysql' 'perl-date-manip' 'perl-moosex-traits' 'syslog-ng')
optdepends=('elsa-web')
provides=()
conflicts=()
replaces=()
source=('searchd')
options=('emptydirs')
backup=('etc/elsa/elsa_node.conf' 'etc/sphinx_stopwords.txt')
install=elsa.install
BASE_DIR=/usr/share
DATA_DIR=/srv
md5sums=('958bdc6daa417399458b30941576f028')
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


package() {
  install -dm755 $pkgdir/$BASE_DIR/
  cp -dpr --no-preserve=ownership $srcdir/elsa/elsa -r $pkgdir/$BASE_DIR/
  install -dm755 $pkgdir/$DATA_DIR/elsa/log 
  install -dm755 $pkgdir/$DATA_DIR/elsa/tmp/buffers/
  install -dm755 $pkgdir/$DATA_DIR/sphinx/log
  mkdir          $pkgdir/etc/
  touch          $pkgdir/etc/sphinx_stopwords.txt
  install -Dm755 searchd $pkgdir/etc/rc.d/searchd
  install -dm755 $pkgdir/etc/elsa
  install -dm755 $pkgdir/usr/share/doc/elsa-node/
  cat "$srcdir/elsa/elsa/node/conf/syslog-ng.conf" | sed -e "s|\/usr\/local|$BASE_DIR|g" | sed -e "s|\/data|$DATA_DIR|g" > "$pkgdir/usr/share/doc/elsa-node/syslog-ng.etc.example"
  chmod 644 $pkgdir/usr/share/doc/elsa-node/syslog-ng.etc.example
  cat "$srcdir/elsa/elsa/node/conf/elsa.conf" | sed -e "s:/usr/local:$BASE_DIR:g" | sed -e "s:/data:$DATA_DIR:g" > $pkgdir/etc/elsa/elsa_node.conf
  chmod 644 $pkgdir/etc/elsa/elsa_node.conf
  install -dm755 $pkgdir/$BASE_DIR/elsa/node/tmp/locks
  touch $pkgdir/$BASE_DIR/elsa/node/tmp/locks/directory
}

# vim:set ts=2 sw=2 et:
