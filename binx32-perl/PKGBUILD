# $Id: PKGBUILD 170125 2012-11-03 10:30:22Z bluewind $
# Upstream Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: kevin <kevin.archlinux.org>
# Contributor: judd <jvinet.zeroflux.org>
# Contributor: francois <francois.archlinux.org> 
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=perl
pkgname=binx32-perl
pkgver=5.16.2
pkgrel=1.1
pkgdesc="A highly capable, feature-rich programming language (x32 ABI)"
arch=(x86_64)
license=('GPL' 'PerlArtistic')
url="http://www.perl.org"
groups=('base')
depends=('libx32-gdbm' 'libx32-db' 'coreutils' 'libx32-glibc' 'sh' "${_basepkgname}")
changelog=ChangeLog
source=(http://www.cpan.org/src/5.0/perl-${pkgver}.tar.bz2 
perlbin.sh
perlbin.csh
provides.pl)
install=perl.install
options=('makeflags' '!purge')
md5sums=('2818ab01672f005a4e552a713aa27b08'
         '2e84592781a65bf1996cfc9cf30969ed'
         '25fbdc239428075e5a47982f586278c1'
         '999c3eea6464860704abbb055a0f0896')

# workaround to let the integrity check find the correct provides array
if [[ ${0##*/} = "parse_pkgbuilds.sh" ]]; then
	true && provides=($(bsdtar -q -O -xf "/srv/ftp/pool/packages/$_basepkgname-$pkgver-$pkgrel-$CARCH.pkg.tar.xz" .PKGINFO | sed -rn 's#^provides = (.*)#\1#p'))
fi

build() {
  cd ${srcdir}/${_basepkgname}-${pkgver}

  #sed -e 's/HOST_EXE_EXT =/HOST_EXE_EXT = -x32/' -i Makefile.SH

  arch_opts="-Dcccdlflags='-fPIC'"

  ./Configure -des -Dusethreads -Duseshrplib -Doptimize="${CFLAGS}" \
    -Dprefix=/usr -Dinstallprefix=${pkgdir}/usr -Dvendorprefix=/usr \
    -Dprivlib=/usr/share/perl5/core_perl \
    -Darchlib=/usr/libx32/perl5/core_perl \
    -Dsitelib=/usr/share/perl5/site_perl \
    -Dsitearch=/usr/libx32/perl5/site_perl \
    -Dvendorlib=/usr/share/perl5/vendor_perl \
    -Dvendorarch=/usr/libx32/perl5/vendor_perl \
    -Dscriptdir=/usr/bin/core_perl-x32 \
    -Dsitescript=/usr/bin/site_perl-x32 \
    -Dvendorscript=/usr/bin/vendor_perl-x32 \
    -Dinc_version_list=none \
    -Dman1ext=1perl -Dman3ext=3perl ${arch_opts} \
    -Dcc="gcc -mx32" -Dcpp="g++ -mx32" -Dperl5="/usr/bin/perl-x32"\
    -Dperlpath="/usr/bin/perl-x32" -Dstartperl="#!/usr/bin/perl-x32" \
    -Dlddlflags="-shared ${LDFLAGS}" -Dldflags="${LDFLAGS}"
  make
}

check() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  TEST_JOBS=$(echo $MAKEFLAGS | sed 's/.*-j\([0-9][0-9]*\).*/\1/') make test_harness
#  make test
}

package() {
  # hack to work around makepkg running the subshell in check_sanity()
  #new_provides=($(cd "$srcdir/perl-$pkgver"; LD_PRELOAD=./libperl.so ./perl -Ilib "$srcdir/provides.pl" .))
  #provides=(${new_provides[@]})

  cd ${srcdir}/${_basepkgname}-${pkgver}
  make install

  ### Perl Settings ###
  # Change man page extensions for site and vendor module builds.
  # Use archlinux email address instead of my own.
  sed -e '/^man1ext=/ s/1perl/1p/' -e '/^man3ext=/ s/3perl/3pm/' \
      -e "/^cf_email=/ s/'.*'/'kevin@archlinux.org'/" \
      -e "/^perladmin=/ s/'.*'/'kevin@archlinux.org'/" \
      -i ${pkgdir}/usr/libx32/perl5/core_perl/Config_heavy.pl

  # Profile script to set paths to perl scripts.
  install -D -m755 ${srcdir}/perlbin.sh \
                   ${pkgdir}/etc/profile.d/perlbin-x32.sh
  # Profile script to set paths to perl scripts on csh. (FS#22441) 
  install -D -m755 ${srcdir}/perlbin.csh \
                  ${pkgdir}/etc/profile.d/perlbin-x32.csh

  (cd ${pkgdir}/usr/bin; mv perl${pkgver} perl)
  (cd ${pkgdir}/usr/bin/core_perl-x32;  ln -sf c2ph pstruct; ln -sf s2p psed)
  grep -Rl "${pkgdir}" ${pkgdir}/usr | \
      xargs sed -i "s^${pkgdir}^^g"

  find $pkgdir/usr/libx32 -name *.pod -delete
  find $pkgdir -name .packlist -delete

  rm -rf "${pkgdir}/usr/share"
  mv ${pkgdir}/usr/bin/perl{,-x32}
  mv ${pkgdir}/usr/bin/a2p{,-x32}
  for x in ${pkgdir}/usr/bin/core_perl-x32/*; do
    sed -e 's/\/usr\/bin\/perl /\/usr\/bin\/perl-x32 /' -i $x
  done
  for x in ${pkgdir}/usr/bin/core_perl-x32/*; do
    sed -e 's/#!\/usr\/bin\/perl$/#!\/usr\/bin\/perl-x32/' -i $x
  done
}
