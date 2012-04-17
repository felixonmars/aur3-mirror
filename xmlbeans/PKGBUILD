#Contributor: Martin špelina<shpelda [at]gmail[dot]com>
#Maintainer: Martin špelina<shpelda [at]gmail[dot]com>
pkgname=xmlbeans
pkgver=2.5.0
__pkgver_underscore=8_0_5
pkgrel=2
pkgdesc="XMLBeans is a technology for accessing XML by binding it to Java types"
url="http://xmlbeans.apache.org/index.html"
license=('custom')
arch=('any')
depends=('java-runtime')
makedepends=(findutils)
#TODO:somehow select mirror
source=('xmlbeans_'$pkgver'::http://apache.mirror.dkm.cz/pub/apache/xmlbeans/binaries/xmlbeans-2.5.0.tgz')
md5sums=('982e8e3d36aa5f7839f7675adc2b0c53')

build() {
  __pkg_lib=/usr/share/java/$pkgname
  __pkg_doc=/usr/share/doc/$pkgname
  __pkg_share=/usr/share/$pkgname 
  __pkg_etc=/etc/$pkgname
  __pkg_bin=/usr/bin
  __pkg_profile=/etc/profile.d/$pkgname.sh

  mkdir -p $pkgdir/$__pkg_lib
  mkdir -p $pkgdir/$__pkg_doc
#  mkdir -p $pkgdir/$__pkg_etc
  mkdir -p $pkgdir/$__pkg_bin
  mkdir -p $pkgdir/$__pkg_share
  mkdir -p $pkgdir/$__pkg_share
  mkdir -p `dirname $pkgdir/$__pkg_profile`
  cd $srcdir/$pkgname-$pkgver
  cp bin/* $pkgdir/$__pkg_bin
  chmod 755 $pkgdir/$__pkg_bin/*
  find $pkgdir/$__pkg_bin -name \*.cmd -delete
  rm $pkgdir/$__pkg_bin/_setlib
  cp -r lib/* $pkgdir/$__pkg_lib
  cp -r doap_XMLBeans.rdf docs/* $pkgdir/$__pkg_doc
  cp -r samples schemas *.txt $pkgdir/$__pkg_share

  echo \#!/bin/sh > $pkgdir/$__pkg_profile
  echo export XMLBEANS_LIB=$__pkg_lib >> $pkgdir/$__pkg_profile
  chmod 755 $pkgdir/$__pkg_profile
}

