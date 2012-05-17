# Maintainer: old_bay

pkgname=dnc-kassa
pkgver=20120517
pkgrel=1
pkgdesc="Densi-kassa: API for Russian buisness hardvare platform and POS for linux"
url="http://dnc-soft.ru"
arch=(i686 x86_64)
license=(GK DENSI)
conflicts=()
depends=('postgresql' 'postgresql-libs' 'openssl-compatibility' 'qt' 'qt3')
makedepends=('gcc43' 'git')
source=(dnc.confd dnc-server.rc dnc.desktop dnc_createdb)
install=dnc.install
_gitroot="git://github.com/oldbay/dnc_kassa"
_gitname="dnc_kassa"

build()
{
  if [ -d $srcdir/$_gitname ]
  then
    msg "Pull local repository"
    cd $srcdir/$_gitname
    git pull
  else
    msg "Clone local repository"
    cd $srcdir
    git clone $_gitroot
  fi
  if [ -d $srcdir/$_gitname-build ]
  then 
    msg "Removing old build directory..."
    rm -fR $srcdir/$_gitname-build
  fi
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  
  # build binary programs and libraries
  cd ${srcdir}/$_gitname-build/src/release
  sh make_arch.sh
  
  # installation  script -  from the original script
  cd ${srcdir}/$_gitname-build

  mkdir ${pkgdir}/etc/{rc.d,conf.d} -p
  mkdir ${pkgdir}/usr/{bin,lib,share} -p
  mkdir ${pkgdir}/var
  mkdir -m 777 ${pkgdir}/var/Exchange
  # installing configuration files
  mkdir -m 777 ${pkgdir}/etc/dancy
  cp ./etc/dancy/* ${pkgdir}/etc/dancy
  chmod 666 ${pkgdir}/etc/dancy/*
  mkdir -m 777 ${pkgdir}/etc/hwsrv
  cp ./etc/hwsrv/* ${pkgdir}/etc/hwsrv
  chmod 666 ${pkgdir}/etc/hwsrv/*
  
  mkdir ${pkgdir}/usr/share/dnc
  mkdir -m 777 ${pkgdir}/usr/share/dnc/movie
  cp ./movie/* ${pkgdir}/usr/share/dnc/movie
  mkdir -m 777 ${pkgdir}/usr/share/dnc/print_doc
  cp ./Example_print_document/* ${pkgdir}/usr/share/dnc/print_doc
  chmod 666 ${pkgdir}/usr/share/dnc/print_doc/*
  mkdir -m 777 ${pkgdir}/usr/share/dnc/icons_for_icewm_menu
  cp ./addon_conf/icons_for_icewm_menu/* ${pkgdir}/usr/share/dnc/icons_for_icewm_menu
  chmod 777 ${pkgdir}/usr/share/dnc/icons_for_icewm_menu/*
  mkdir -m 777 ${pkgdir}/usr/share/dnc/db
  mkdir -m 777 ${pkgdir}/usr/share/dnc/db/LinCash
  cp ./db/LinCash/* ${pkgdir}/usr/share/dnc/db/LinCash
  chmod 666 ${pkgdir}/usr/share/dnc/db/LinCash/*
  mkdir -m 777 ${pkgdir}/usr/share/dnc/db/Transaction
  cp ./db/Transaction/* ${pkgdir}/usr/share/dnc/db/Transaction
  chmod 666 ${pkgdir}/usr/share/dnc/db/Transaction/*
  mkdir -m 777 ${pkgdir}/usr/share/dnc/db/DiscountMobile
  cp ./db/DiscountMobile/* ${pkgdir}/usr/share/dnc/db/DiscountMobile
  chmod 666 ${pkgdir}/usr/share/dnc/db/DiscountMobile/*
  
  cp ./addon_conf/Export_Import_bd/* ${pkgdir}/usr/bin
  chmod 777 ${pkgdir}/usr/bin/*

  #installing binary programs
  cp ${srcdir}/$_gitname-build/src/release/bin/bin/* ${pkgdir}/usr/bin
  rm ${pkgdir}/usr/bin/null.txt

  # installing share loaded libraries
  cp ${srcdir}/$_gitname-build/src/release/bin/lib/* ${pkgdir}/usr/lib
  rm ${pkgdir}/usr/lib/null.txt

  # simlinks for libraries
  cd ${pkgdir}/usr/lib
  ln -s libdncdecoder_qt4.so.1.0.0 libdncdecoder_qt4.so.1
  ln -s libpq.so.5 libpq.so.4

  # making archdb system for DNC project
  mkdir -m 777 ${pkgdir}/dnc_arch

  # Install createdb file
  install -D -m 755 ${srcdir}/dnc_createdb ${pkgdir}/usr/bin/dnc_createdb

  #installing daemon script and confd
  install -Dm 755 ${srcdir}/dnc-server.rc ${pkgdir}/etc/rc.d/dnc-server
  install -Dm 644 ${srcdir}/dnc.confd ${pkgdir}/etc/conf.d/dnc-server

  # Install the icon file
  install -D -m 644 ${pkgdir}/usr/share/dnc/icons_for_icewm_menu/dnc3.png ${pkgdir}/usr/share/pixmaps/dnc.png

  # Install desktop file
  install -D -m 644 ${srcdir}/dnc.desktop ${pkgdir}/usr/share/applications/dnc.desktop

}
md5sums=('b5d6218f4d2426701e022c315a54d6b5'
         'a9de56a6234189b47e55c093fd410644'
         '8cca6ce9e6b38c2bd7205cb65cb1f98a'
         'b24ec74f1f597131dc3393873dc59cd6')
