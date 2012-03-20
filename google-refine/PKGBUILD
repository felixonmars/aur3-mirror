# Maintainer: Dan Serban

pkgname=google-refine
pkgver=2.5_r2407
pkgrel=1
pkgdesc="A power tool for working with messy data"
arch=(any)
url=http://code.google.com/p/google-refine/
license=(BSD)
depends=(java-runtime)
options=('!strip')
source=("http://google-refine.googlecode.com/files/google-refine-2.5-r2407.tar.gz")
md5sums=('614ecbf1d9995e93c0953d6ea2ca0467')

build()
{
  mv google-refine-2.5 google-refine
  # applies patch from http://code.google.com/p/google-refine/issues/detail?id=503
  patch google-refine/refine ../503.patch
  chgrp -R users google-refine
  chmod g+w google-refine
  mkdir -p "${pkgdir}"/usr/share
  mv google-refine "${pkgdir}"/usr/share/
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/refine
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'cd /usr/share/google-refine' >> "${USRBINFILE}"
  echo './refine' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
}

