# Maintainer: Stefan Melmuk <stefan at diebin dot at>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Dimitri Pekarovsky <dimitri dot pekarovsky where gmail dot com>

pkgname=sympa
pkgver=6.1.22
pkgrel=0
pkgdesc="A mailing list management software"
url="http://www.sympa.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
  # Available in standard repos
  'perl-archive-zip' 'perl-dbd-mysql' 'perl-crypt-openssl-bignum'
  'perl-crypt-openssl-rsa' 'perl-fcgi' 'perl-file-copy-recursive'
  'perl-html-formattext' 'perl-mail-dkim' 'perl-soap-lite'
  'perl-term-progressbar' 'perl-template-toolkit' 'perl-xml-libxml'

  # Available in AUR
  'perl-html-stripscripts-parser' 'perl-digest-sha' 'perl-encode'
  'perl-crypt-ciphersaber' 'perl-file-temp' 'perl-mime-base64'
  'perl-mime-encwords' 'perl-net-netmask'
  'perl-regexp-common' 'perl-test-harness'
)
install="sympa.install"
source=("http://www.sympa.org/distribution/$pkgname-$pkgver.tar.gz"
        'sympa.install'
        'sympa.service'
        'sympa-archived.service'
        'sympa-bounced.service'
        'sympa-bulk.service'
        'sympa-task_manager.service')
md5sums=('072e108875bcdf4c4cc8d5ebad56f0ed'
         'e8c4e4b3f5eb806841a1bd9b4b341da7'
         'e70c2f30526a4c27434265063bd21f25'
         'c5c0b75b972493a475ea1851774e047c'
         '24329daa2fad511b7c529e648aaf0b19'
         'f2955f2f5d0fc25f005b8e6911897768'
         '23f27ae340e6039a12b4f6d3fc7095d0')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  export PATH=$PATH:/usr/bin/core_perl

  ./configure \
    --prefix=/var/lib/sympa \
    --sysconfdir=/etc/sympa \
    --with-confdir=/etc/sympa \
    --with-aliases_file=/etc/sympa/aliases \
    --with-etcdir=/etc/sympa \
    --with-spooldir=/var/lib/sympa/spool \
    --with-expldir=/var/lib/sympa/list_data \
    --with-piddir=/var/lib/sympa \
    --with-lockdir=/var/lib/sympa \
    --with-docdir=/usr/share/doc/sympa \
    --with-mandir=/usr/share/man \
    --with-defaultdir=/var/lib/sympa/default \
    --with-staticdir=/var/lib/sympa/static \
    --with-localedir=/usr/share/sympa/locale \
    --with-bindir=/usr/lib/sympa \
    --with-sbindir=/usr/lib/sympa \
    --with-cgidir=/usr/lib/sympa/cgi \
    --with-libexecdir=/usr/lib/sympa \
    --with-libdir=/usr/lib/sympa \
    --with-scriptdir=/usr/lib/sympa/scripts \
    --with-modulesdir=/usr/lib/sympa/modules \
    --with-perl=`/usr/bin/which perl`


  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="$pkgdir" install

  # we don't need init.d files
  rm -rf "$pkgdir/etc/rc.d"

  # we need systemd unit files
  install -d "$pkgdir/usr/lib/systemd/system"

  install -D -m644 "$srcdir/sympa.service" "$pkgdir/usr/lib/systemd/system/"
  install -D -m644 "$srcdir/sympa-archived.service" "$pkgdir/usr/lib/systemd/system/"
  install -D -m644 "$srcdir/sympa-bounced.service" "$pkgdir/usr/lib/systemd/system/"
  install -D -m644 "$srcdir/sympa-bulk.service" "$pkgdir/usr/lib/systemd/system/"
  install -D -m644 "$srcdir/sympa-task_manager.service" "$pkgdir/usr/lib/systemd/system/"

  chown -R 52:52 "$pkgdir/var/lib/sympa"
}

# vim:set ts=2 sw=2 et:
