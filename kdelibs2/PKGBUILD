# Contributor: Lisa Denia <eiffel56@gmail.com>
pkgname=kdelibs2
pkgver=2.2.2
pkgrel=2
pkgdesc="KDE Core Libraries"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('qt2>=2.3.2-2' glib2 python audiofile fam libxslt libxext libsm libcups libtiff audiofile pcre bzip2 libcups libsasl openssl alsa-lib)
makedepends=(automake-1.5 autoconf-2.5 svn imake bison flex gettext)
source=(kdelibs-2.2.2_missingfiles.patch.bz2 
        kdelibs-2.2.2_gcc43fix6.patch.bz2 
        kdelibs-2.2.2_force_alsa09.patch.gz)
md5sums=('565e867ae5b8133442454d9290e6e61f'
         'd2efba1ccf3da2f456304d0f89e586f7'
         '12ba8135625befc18a2e949e9b2e6f45')

build() {
  unset LD_PRELOAD
  cd ${srcdir}
  if [ -f $startdir/kdelibs.tar.gz ]; then
    tar -xf $startdir/kdelibs.tar.gz
  else
    if [ ! -d kdelibs ]; then
      svn co svn://anonsvn.kde.org/home/kde/tags/KDE/$pkgver/kdelibs kdelibs
    fi
  fi
  [ -e kdelibs-build ] && rm -Rf kdelibs-build
  cp -R kdelibs kdelibs-build
  cd kdelibs-build

  patch -p1 -i ${srcdir}/kdelibs-2.2.2_gcc43fix6.patch || return 1
  patch -p1 -i ${srcdir}/kdelibs-2.2.2_missingfiles.patch || return 1
  patch -p1 -i ${srcdir}/kdelibs-2.2.2_force_alsa09.patch || return 1

  source /opt/qt2/env.sh
  export PATH=/opt/autoconf-2.5/bin:/opt/automake-1.5/bin:$PATH
  mkdir -p $pkgdir/opt/kde2

  #
  # BUILD
  #

  make -f Makefile.cvs
  sed 's%perl -i.bak $ac_aux_dir/conf.change.pl $CONFIG_STATUS%perl -i.bak $ac_aux_dir/conf.change.pl $CONFIG_STATUS || mv $CONFIG_STATUS.bak $CONFIG_STATUS;%g' -i configure
  sed 's/|| mv $CONFIG_STATUS.bak $CONFIG_STATUS;//g' -i configure
  CXXFLAGS+=" -fpermissive" ./configure --with-qt-dir=$QTDIR --prefix=/opt/kde2/
  make || return 1
  make install DESTDIR=$pkgdir/ || return 1
}
