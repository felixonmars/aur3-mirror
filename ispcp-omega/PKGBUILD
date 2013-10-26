# Maintainer: Techlive Zheng<techlivezheng [at] gmail [dot] com>
pkgname=ispcp-omega
pkgdesc="A project founded to build a Multi Server Control and Administration Panel without limits."
pkgver=1.0.7
pkgrel=2
arch=('any')
url="http://isp-control.net/"
license=('MPL' 'LGPL' 'GPLv2')
groups=()
depends=(
        'xz'
        'lynx'
        'ispell'
        'net-snmp'
        'net-tools'
        'bind>=9'
        'apache'
        'openssh'
        'awstats'
        'postfix'
        'proftpd'
        'postgrey'
        'policyd-weight'
        'procmail'
        'dnsutils'
        'rkhunter'
        'iptables'
        'cyrus-sasl'
        'chkrootkit'
        'courier-imap'
        'courier-authlib'
        'libsasl>=2'
        'libmcrypt'
        'libmysqlclient'
        'php'
        'php-gd'
        'php-cgi'
        'php-pear'
        'php-mcrypt'
        'mod_fcgid'
        'mod_fastcgi'
        'mysql'
        'mysql-clients'
        'perl'
        'perl-berkeleydb'
        'perl-capture-tiny'
        'perl-crypt-cbc'
        'perl-crypt-blowfish'
        'perl-crypt-passwdmd5'
        'perl-date-calc'
        'perl-date-manip'
        'perl-datetime'
        'perl-datetime-timezone'
        'perl-dbd-mysql'
        'perl-dbi'
        'perl-digest-md5'
        'perl-file-copy-recursive'
        'perl-file-mimeinfo'
        'perl-html-parser'
        'perl-io-stringy'
        'perl-mail-sendmail'
        'perl-mailtools'
        'perl-mime-tools'
        'perl-net-dns'
        'perl-net-libidn'
        'perl-net-netmask'
        'perl-smtp-server'
        'perl-term-readkey'
        'perl-term-read-password'
        'perl-timedate'
        'perl-module-implementation'
        )
optdepends=(
		'amavisd-new'
		'spamassassin'
)
makedepends=()
provides=()
replaces=()
conflicts=()
backup=(
        'etc/ispcp/ispcp.conf'
        'etc/logrotate.d/ispcp'
        'etc/conf.d/ispcp_daemon.conf'
        'etc/conf.d/ispcp_network.conf'
        'etc/proftpd/ispcp/root_domain.conf'
        'srv/http/ispcp/engine/ispcp-db-keys.pl'
        'srv/http/ispcp/engine/messenger/ispcp-db-keys.pl'
        'srv/http/ispcp/gui/include/ispcp-db-keys.php'
)
options=('emptydirs')
source=("ispcp-omega-${pkgver}.tar.bz2::http://sourceforge.net/project/downloading.php?group_id=189485&filename=ispcp-omega-${pkgver}.tar.bz2"
        "https://github.com/downloads/techlivezheng/ispcp-arch-config/ispcp-arch-config-${pkgver}-${pkgrel}.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cp -rv ../ispcp-arch-config-${pkgver}-${pkgrel}/Makefile.arch .

  if [ -d configs/arch ];then
    rm -rf configs/arch
  fi

  cp -rv ../ispcp-arch-config-${pkgver}-${pkgrel}/config configs/arch

  mkdir -p configs/common/pma/parts

  sed -i "s:error.png:error:g" gui/reseller/users.php gui/include/admin-functions.php
  sed -i "s:reload.png:reload:g" gui/reseller/users.php gui/include/admin-functions.php

  find . -name Makefile -print | xargs sed -i "s:/usr/bin/install:/bin/install:g"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -f Makefile.arch INST_PREF="$pkgdir" install

  find "$pkgdir" -type f -name empty-file -delete
}

md5sums=('dfebf84b49d59ef46c3b5710811ec772'
         '8ddca367b0ca4adbc5f08c482d69ac17')
