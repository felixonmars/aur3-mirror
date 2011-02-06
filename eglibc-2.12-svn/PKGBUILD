# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Based on official glibc PKGBUILD.

pkgname=eglibc-2.12-svn
pkgver=10809
pkgrel=1
pkgdesc="Embedded GLIBC is a variant of the GNU C Library that is designed to work well on embedded systems"
arch=('i686' 'x86_64')
url="http://www.eglibc.org"
license=('GPL' 'LGPL')
depends=('linux-api-headers' 'tzdata')
makedepends=('subversion')
provides=('glibc=2.12')
conflicts=('glibc')
#replaces=('glibc')
backup=(etc/locale.gen etc/nscd.conf)
options=('!strip')
install=eglibc.install
changelog=ChangeLog
source=(glibc-2.10-bz4781.patch
        glibc-__i686.patch
        locale-gen
        locale.gen.txt
        nscd)
md5sums=('0c5540efc51c0b93996c51b57a8540ae'
         '40cd342e21f71f5e49e32622b25acc52'
         '476e9113489f93b348b21e144b6a8fcf'
         '07ac979b6ab5eeb778d55f041529d623'
         'b587ee3a70c9b3713099295609afde49')

_svntrunk=svn://svn.eglibc.org/branches/eglibc-2_12/libc
_svnmod=libc

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  rm -rf ${srcdir}/$_svnmod-build
  cp -r ${srcdir}/$_svnmod ${srcdir}/$_svnmod-build

  cd ${srcdir}/$_svnmod-build

  # http://sources.redhat.com/bugzilla/show_bug.cgi?id=4781
  patch -Np1 -i ${srcdir}/glibc-2.10-bz4781.patch

  # http://sources.redhat.com/bugzilla/show_bug.cgi?id=411
  # http://sourceware.org/ml/libc-alpha/2009-07/msg00072.html
  patch -Np1 -i ${srcdir}/glibc-__i686.patch

  # Fix SVN timestamp to prevent regenerating configure files.
  find -name 'configure' | xargs touch

  # Don not build timezones
  sed -i 's/timezone rt/rt/' Makeconfig

  install -dm755 ${pkgdir}/etc
  touch ${pkgdir}/etc/ld.so.conf

  mkdir eglibc-build
  cd eglibc-build

  if [ "${CARCH}" = "i686" ]; then
    # Hack to fix NPTL issues with Xen, only required on 32bit platforms
    export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
  fi

  echo "slibdir=/lib" >> configparms

  ../configure --prefix=/usr \
    --mandir=/usr/share/info \
    --infodir=/usr/share/info \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-headers=/usr/include \
    --enable-kernel=2.6.33 \
    --enable-add-ons=nptl,libidn \
    --disable-profile \
    --enable-bind-now \
    --with-tls \
    --with-__thread \
    --without-cvs \
    --without-gd

  make
}

package() {
  cd ${srcdir}/$_svnmod-build/eglibc-build
  make install_root=${pkgdir} install

  # provided by kernel-headers
  rm ${pkgdir}/usr/include/scsi/scsi.h

  rm ${pkgdir}/etc/ld.so.conf

  install -dm755 ${pkgdir}/etc/rc.d
  install -dm755 ${pkgdir}/usr/sbin
  install -dm755 ${pkgdir}/usr/lib/locale
  install -m755 ${srcdir}/nscd ${pkgdir}/etc/rc.d/nscd
  install -m755 ${srcdir}/locale-gen ${pkgdir}/usr/sbin

  sed 's/^\tserver-user/#\tserver-user/' \
      ${srcdir}/$_svnmod-build/nscd/nscd.conf > ${pkgdir}/etc/nscd.conf

  # create /etc/locale.gen
  sed 's|/| |g;
       s|\\| |g;
       s|SUPPORTED-LOCALES=||;
       s|^|#|g' \
      ${srcdir}/locale.gen.txt \
      ${srcdir}/$_svnmod-build/localedata/SUPPORTED \
      > ${pkgdir}/etc/locale.gen

  if [ "${CARCH}" = "x86_64" ]; then
    # fix for the linker
    sed -i '/RTLDLIST/s%/ld-linux.so.2 /lib64%%' ${pkgdir}/usr/bin/ldd
    #Comply with multilib binaries, they look for the linker in /lib64
    mkdir ${pkgdir}/lib64
    cd ${pkgdir}/lib64
    ln -v -s ../lib/ld* .
  fi

  cd $pkgdir
  strip $STRIP_BINARIES sbin/{ldconfig,sln} \
                        usr/bin/{gencat,getconf,getent,iconv,locale} \
                        usr/bin/{localedef,pcprofiledump,rpcgen,sprof} \
                        usr/lib/getconf/* \
                        usr/sbin/{iconvconfig,nscd,rpcinfo}
  [[ $CARCH = "i686" ]] && strip $STRIP_BINARIES usr/bin/lddlibc4

  strip $STRIP_STATIC usr/lib/*.a \
                      lib/{{ld,libpthread}-2.12,libthread_db-1.0}.so

  strip $STRIP_SHARED lib/{libanl,libBrokenLocale,libc,libcidn,libcrypt}-2.12.so \
                      lib/libnss_{compat,dns,files,hesiod,nis,nisplus}-2.12.so \
                      lib/{libdl,libm,libnsl,libresolv,librt,libutil}-2.12.so \
                      lib/{libmemusage,libpcprofile,libSegFault}.so \
                      usr/lib/{pt_chown,gconv/*.so}
}
