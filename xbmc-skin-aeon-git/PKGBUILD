# Contributor: Ralf Barth <archlinux dot or at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail
# Maintainer: graysky <da_audiophile at yahoo>

pkgname=xbmc-skin-aeon-git
pkgver=20100421
pkgrel=1
pkgdesc="Aeon skin for XBMC (git version)"
arch=('i686' 'x86_64')
url="http://www.aeonproject.com/"
source=('http://www.aeonproject.com/dropbin/Aeon_Fonts.zip')
noextract=('Aeon_Fonts.zip')
depends=('xbmc')
makedepends=('git' 'unzip')
provides=()
groups=('multimedia')
license=('GPL')
options=()
md5sums=('220df1006a5d06fe6b9cd3ec38b133a6')
sha256sums=('2527ce2670474d769cfb6f900495a007e0230e4cb477d14fbba456faaeeeef94')

build() {

  _gitversion="a31c3b6713aea8bcc94823891cb20c634a34ba5e"
  _gitroot="http://github.com/djh/aeon.git"
  _gitname="aeon"

  cd ${srcdir}
  msg "Connecting to github.com GIT server..."

  if [ ! -d ${srcdir}/$_gitname ] ; then
    msg "No local branch found, cloning remote branch..."
    git clone $_gitroot
    cd $srcdir/$_gitname && git checkout --track -b auriga origin/auriga
  fi

  cd $srcdir/$_gitname && git checkout $_gitversion
  msg "GIT checkout done or server timeout"

  # Copy tree to share location
  mkdir -p $pkgdir/opt/xbmc/skin/$_gitname
  cp -r $startdir/src/$_gitname/* $pkgdir/opt/xbmc/skin/$_gitname/

  # Unzip fonts into skin location
  unzip -q ${srcdir}/Aeon_Fonts.zip -d $pkgdir/opt/xbmc/skin/$_gitname/
}
