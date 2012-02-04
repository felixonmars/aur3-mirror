#Maintainer Jekyll Wu <adaptee [at] gmail [dot] com>

pkgname=krazy2
pkgver=20111125
pkgrel=1
pkgdesc="The KDE 'Krazy' Checker"
arch=('i686' 'x86_64')
url="http://www.kde.org/"
license=('GPL')
depends=('qt' 'perl-tie-ixhash' 'perl-xml-libxml' 'perl-html-parser' 'perl-yaml' 'desktop-file-utils')

_gitroot="git://gitorious.org/krazy/krazy.git"
_gitname="$pkgname"

build() {
  cd ${srcdir}

  msg "Connecting to ${_gitname} GIT server..."
  if [ -d ${_gitname} ]; then
      cd ${_gitname} && git pull origin master
      msg "The local files are updated."
  else
      git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout. Preparing sources..."
  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
}

package() {

  cd "${srcdir}/${_gitname}-build"

  perl Makefile.PL PREFIX=/usr
  make || return 1
  make DESTDIR="${pkgdir}/" install || return 1

  mv -f ${pkgdir}/usr/bin/site_perl/krazy2* ${pkgdir}/usr/bin/
  rmdir ${pkgdir}/usr/bin/site_perl

  V=`perl -e 'printf "%vd", $^V'`
  ln -sf /usr/share/perl5/site_perl/${V}/Krazy ${pkgdir}/usr/lib/Krazy

  cd helpers
  make PREFIX=/usr DESTDIR="${pkgdir}/" install || return 1
  cd ..

  cd plugins
  make PREFIX=/usr DESTDIR="${pkgdir}/" install || return 1
  cd ..

  cd extras
  make PREFIX=/usr DESTDIR="${pkgdir}/" install || return 1
  cd ..

  cd src
  qmake || return 1
  make || return 1
  make INSTALL_ROOT="${pkgdir}/usr/" install || return 1
  cd ..

  cd sets
  make PREFIX=/usr DESTDIR="${pkgdir}/" install || return 1
  cd ..

  mkdir -p "$pkgdir/usr/share/dtd"
  cd share 
  cp *.dtd "$pkgdir/usr/share/dtd"
  cd ..

  mkdir -p "$pkgdir/usr/share/xsl"
  cd stylesheets 
  cp *.xsl "$pkgdir/usr/share/xsl"
  cd ..

  mkdir -p "$pkgdir/usr/conf"
  cp conf/settings.yaml "$pkgdir/usr/conf"

}
