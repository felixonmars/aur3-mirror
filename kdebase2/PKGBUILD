# Contributor: Lisa Denia <eiffel56@gmail.com>
pkgname=kdebase2
pkgver=2.2.2
pkgrel=2
pkgdesc="KDE Base Programs"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdelibs2>=2.2.2-2' fam libgl cdparanoia xorg-utils xorg-server pam libgl libldap libogg libvorbis)
makedepends=(automake-1.5 autoconf-2.5 svn imake libtool)
source=(kdebase-2.2.2_gcc43fix4.patch.bz2
        ksysguard-2.2.2_disable-lmsensors.patch.gz
        kdebase-2.2.2_kcontrol_PAGE_SHIFT_fix.patch.gz
        kdebase-2.2.2_audiocd_lamefix.patch.gz
        kdebase-2.2.2_missingfiles.patch.bz2)
md5sums=('b3eb4e67b9e646dc4795c97ef57a8edd'
         'bcade9b1bb27bd4f27ccff3337360af3'
         'ace579af50523560ca18f9c36a2dcd75'
         'cf821cecb02405b509f003cdef27984a'
         '3f74e087c7962bc8d1f7a18d9f49b074')

build() {
  unset LD_PRELOAD
  cd ${srcdir}
  if [ -f $startdir/kdebase.tar.gz ]; then
    tar -xf $startdir/kdebase.tar.gz || return 1
  else
    if [ ! -d kdelibs ]; then
      svn co svn://anonsvn.kde.org/home/kde/tags/KDE/$pkgver/kdebase kdebase || return 1
    fi
  fi
  [ -e kdebase-build ] && rm -Rf kdebase-build 
  cp -R kdebase kdebase-build || return 1
  cd kdebase-build

  patch -p1 -i ${srcdir}/kdebase-2.2.2_gcc43fix4.patch  || return 1
  patch -p1 -i ${srcdir}/ksysguard-2.2.2_disable-lmsensors.patch  || return 1
  patch -p1 -i ${srcdir}/kdebase-2.2.2_audiocd_lamefix.patch  || return 1
  cd kcontrol
  patch -p1 -i ${srcdir}/kdebase-2.2.2_kcontrol_PAGE_SHIFT_fix.patch  || return 1
  cd ..
  patch -p1 -i ${srcdir}/kdebase-2.2.2_missingfiles.patch || return 1

  source /opt/qt2/env.sh
  export PATH=/opt/autoconf-2.5/bin:/opt/automake-1.5/bin:$PATH
  mkdir -p $pkgdir/opt/kde2

  #
  # BUILD
  #

  make -f Makefile.cvs
  sed 's%perl -i.bak $ac_aux_dir/conf.change.pl $CONFIG_STATUS%perl -i.bak $ac_aux_dir/conf.change.pl $CONFIG_STATUS || mv $CONFIG_STATUS.bak $CONFIG_STATUS;%g' -i configure
  sed 's/|| mv $CONFIG_STATUS.bak $CONFIG_STATUS;//g' -i configure
  CXXFLAGS+=" -fpermissive" ./configure --with-qt-dir=$QTDIR --prefix=/opt/kde2
  make || return 1
  make install DESTDIR=$pkgdir/ || return 1
}
