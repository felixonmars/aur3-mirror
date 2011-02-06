# Maintainer: Liu Chang <goduck777@gmail.com>
 
pkgname=ibus-sunpinyin-git
pkgver=20101201
pkgrel=1
pkgdesc='The Sunpinyin ibus wrapper. Sunpinyin is a statistical language model based pinyin IME by Sun.'
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ibus' 'sunpinyin-git' 'sqlite3' 'gettext')
makedepends=('git' 'pkgconfig' 'scons' 'intltool')
url='http://code.google.com/p/sunpinyin/'
conflicts=('ibus-sunpinyin')
provides=('ibus-sunpinyin')
source=()
md5sums=()

_gitroot="git://github.com/sunpinyin/sunpinyin.git"
_gitname="sunpinyin"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  
  cd wrapper/ibus
  sed -i -e "s|python|python2|" setup/ibus-setup-sunpinyin.in
  scons --prefix=/usr
  scons install --prefix=/usr --install-sandbox=$pkgdir || return 1

  rm -rf $srcdir/$_gitname-build
}
