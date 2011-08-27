# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=pinentry-qt4-svn
pkgver=210
pkgrel=2
pkgdesc="A Qt4 PIN or passphrase entry dialog which utilize the Assuan protocol"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnupg.org/aegypten2"
depends=('qt')
makedepends=('subversion')
provides=('pinentry')
conflicts=('pinentry' 'pinentry-qt4')
replaces=('pinentry' 'pinentry-qt4')
md5sums=()

_svntrunk=svn://cvs.gnupg.org/pinentry/trunk/
_svnmod=pinentry

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/$_svnmod-build ]; then
    rm -r $_svnmod-build
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
# Generating new moc files

  msg "Generating new moc files"

moc qt4/pinentrydialog.h > qt4/pinentrydialog.moc
moc qt4/qsecurelineedit.h > qt4/qsecurelineedit.moc

touch doc/version.texi

./autogen.sh
  ./configure --prefix=/usr \
	--disable-pinentry-curses \
	--disable-pinentry-qt \
	--disable-pinentry-gtk \
	--disable-pinentry-gtk2 \
	--disable-fallback-curses \
        --enable-pinentry-qt4 \

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm ${pkgdir}/usr/share/info/dir || return 1
  
}