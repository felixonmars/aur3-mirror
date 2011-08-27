# Contributor: Jan Tylich (Kurt) <jan.tylich (at) gmail.com>
pkgname=qutim-l10n-git
pkgver=20101111
pkgrel=1
pkgdesc="QutIM git translations: Bulgarian, Czech, German, Russian and Ukrainian (BG, CZ, DE, RU, UK)"
arch=('any')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
makedepends=('git')
optdepends=(
'qutim-protocol-: Messaging protocols support'
'qutim-plugin-: Additional features'
)

_gitroot="git://gitorious.org/qutim/translations.git"
_gitname="translations"

build() {
#git work
  if [ -d $srcdir/$_gitname ]
  then
  msg "Updating local repository..."
  cd $_gitname
  git pull origin master || return 1
  msg "The local files are updated."
  else
  git clone $_gitroot
  cd $_gitname
  fi
  msg "git checkout done or server timeout"
  msg "Creating temporary build directory..."
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build/

  langDir=/usr/share/qutim/languages      #directory for QutIM languages
  lang='bg_BG cs_CZ de_DE ru_RU uk_UA'    # you can erase languages


  for i in $lang; do
  msg "Building and installing...$i"
  ./make.sh compile $i
  install -d $srcdir/$_gitname-build/$i/binaries $pkgdir/usr/share/qutim/languages/$i
  mv $srcdir/$_gitname-build/$i/binaries/* $pkgdir/$langDir/$i/
  done

  msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_gitname}-build
}
# vim:syntax=sh