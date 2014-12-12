# Maintainer: Nigel Gourlay <ngourlay@gmail.com>

pkgname=koha
pkgver=3.18.00
pkgrel=5
pkgdesc='Fully featured library information system'
arch=('any')
url='http://koha-community.org'
options=('!emptydirs')
license=('GPL2')
source=("http://download.koha-community.org/${pkgname}-${pkgver}.tar.gz")
md5sums=('381425e6fc2ad0e5dd9b274b517a0568')
backup=('etc/koha/koha-conf.xml' 'etc/koha/koha-httpd.conf')
depends=( 'perl>=5.10' 'mysql>=5' 'idzebra>=2.0.22' 'apache>=2' 'graphicsmagick>=0.00' 'perl-algorithm-checkdigits>=0.5' 'perl-anyevent>=5.0' 'perl-anyevent-http>=2.13' 'perl-archive-extract>=0.60' 'perl-archive-zip>=1.30' 'perl-authen-cas-client>=0.05' 'perl-biblio-endnotestyle>=0.05' 'perl-business-isbn>=2.05' 'perl-cache>=0.00' 'perl-cache-fastmmap>=1.34' 'perl-cache-memcached-fast>=0.17' 'perl-cgi>=0.00' 'perl-cgi-session>=4.2' 'perl-cgi-session-driver-memcached>=0.04' 'perl-cgi-session-serialize-yaml>=4.2' 'perl-class-accessor>=0.3' 'perl-class-factory-util>=1.6' 'perl-convert-basen>=0.01' 'perl-crypt-eksblowfish>=0.00' 'perl-crypt-gcrypt>=1.24' 'perl-data-dumper>=2.121' 'perl-data-ical>=0.13' 'perl-date-calc>=5.4' 'perl-date-manip>=5.44' 'perl-datetime>=0.58' 'perl-datetime-event-ical>=0.08' 'perl-datetime-format-dateparse>=0.04' 'perl-datetime-format-ical>=0.09' 'perl-datetime-format-mysql>=0.04' 'perl-datetime-set>=0.28' 'perl-datetime-timezone>=1.20' 'perl-dbd-mock>=1.39' 'perl-dbd-mysql>=4.004' 'perl-dbd-sqlite2>=0.33' 'perl-dbi>=1.53' 'perl-dbix-class-schema-loader>=0.07039' 'perl-digest-md5>=2.36' 'perl-digest-sha>=5.61' 'perl-email-date>=1.103' 'perl-email-valid>=0.190' 'perl-file-path>=2.07' 'perl-file-slurp>=9999.13' 'perl-file-temp>=0.22' 'perl-font-ttf>=0.45' 'perl-gd>=2.39' 'perl-gd-barcode>=0.00' 'perl-getopt-long>=2.35' 'perl-gravatar-url>=1.03' 'perl-html-formattext>=1.23' 'perl-html-scrubber>=0.08' 'perl-http-cookies>=1.39' 'perl-http-message>=0.00' 'perl-http-oai>=3.2' 'perl-httpd-bench-apachebench>=0.73' 'perl-ipc-cmd>=0.46' 'perl-json>=2.07' 'perl-ldap>=0.00' 'perl-library-callnumber-lc>=0.22' 'perl-libwww>=0.00' 'perl-lingua-stem>=0.82' 'perl-lingua-stem-snowball>=0.952' 'perl-list-moreutils>=0.21' 'perl-locale-codes>=0.00' 'perl-locale-currency-format>=1.28' 'perl-locale-maketext>=1.19' 'perl-locale-maketext-lexicon>=0.91' 'perl-locale-po>=0.17' 'perl-lwp-protocol-https>=5.836' 'perl-mail-sendmail>=0.79' 'perl-marc-charset>=0.98' 'perl-marc-crosswalk-dublincore>=0.02' 'perl-marc-record>=2.0.6' 'perl-marc-xml>=0.00' 'perl-memoize-memcached>=0.03' 'perl-mime-base64>=0.00' 'perl-mime-lite>=3' 'perl-modern-perl>=1.03' 'perl-module-bundled-files>=0.03' 'perl-module-load-conditional>=0.38' 'perl-module-pluggable>=3.9' 'perl-net-server>=0.97' 'perl-net-z3950-zoom>=1.16' 'perl-number-format>=1.52' 'perl-openoffice-oodoc>=2.125' 'perl-pdf-api2>=2' 'perl-pdf-api2-simple>=1' 'perl-pdf-reuse>=0.33' 'perl-pdf-reuse-barcode>=0.05' 'perl-pdf-table>=0.9.3' 'perl-readonly>=1.03' 'perl-readonly-xs>=1.02' 'perl-scalar-list-utils>=0.00' 'perl-schedule-at>=1.06' 'perl-sms-send>=0.05' 'perl-soap-lite>=0.712' 'perl-storable>=2.20' 'perl-string-random>=0.22' 'perl-template-plugin-htmltotext>=0.03' 'perl-template-plugin-json-escape>=0.02' 'perl-template-toolkit>=0.00' 'perl-term-ansicolor>=1.1' 'perl-test>=1.25' 'perl-test-dbix-class>=0.42' 'perl-test-deep>=0.106' 'perl-test-harness>=2.56' 'perl-test-mockmodule>=0.05' 'perl-test-mockobject>=1.09' 'perl-test-simple>=0.00' 'perl-test-strict>=0.14' 'perl-test-warn>=0.21' 'perl-test-www-mechanize>=1.44' 'perl-test-yaml-valid>=0.04' 'perl-text-bidi>=0.03' 'perl-text-csv>=0.01' 'perl-text-csv-encoded>=0.09' 'perl-text-csv_xs>=0.32' 'perl-text-iconv>=1.7' 'perl-text-pdf>=0.00' 'perl-text-tabs-wrap>=0.00' 'perl-text-unaccent>=1.08' 'perl-time-hires>=1.86' 'perl-unicode-normalize>=0.32' 'perl-universal-require>=0.13' 'perl-uri-escape>=1.36' 'perl-xml-dumper>=0.81' 'perl-xml-libxml>=1.59' 'perl-xml-libxslt>=1.59' 'perl-xml-rss>=1.31' 'perl-xml-sax>=0.00' 'perl-xml-sax-writer>=0.44' 'perl-xml-simple>=2.14' 'perl-yaml>=0.71' 'perl-yaml-syck>=0.71')
install=${pkgname}.install

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
