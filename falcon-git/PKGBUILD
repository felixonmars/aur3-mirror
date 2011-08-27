# Maintainer: Maik Beckmann <beckmann dot maik at googlemail dot com>
pkgname=falcon-git
pkgver=20101009
pkgrel=2
pkgdesc="A truly multi-paradigm scripting language with good embed- and extensibility."
url="http://www.falconpl.org"
arch=('i686' 'x86_64')
license=('custom:GPL or FPLL')
depends=()
makedepends=('git' 'cmake')
optdepends=()
provides=('falcon' 'falcon-feathers')
install=$pkgname.install
source=()
md5sums=()


_gitroot="http://git.falconpl.org/falcon.git"
_gitname="falcon"

build() {
  cd $srcdir

  if [ -d ${_gitname} ] ; then
    cd $_gitname && git pull origin
    msg 'The local files are updated.'
  else
    msg 'getting sources...'
    git clone $_gitroot $_gitname
  fi

  cd $srcdir
  rm -rf build
  mkdir build && cd build

  # activates core, feathers and faldoc ( which is in apps/ )
  cmake \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DFALCON_WITH_EDITLINE=on -DFALCON_WITH_INTERNAL_EDITLINE=off -DFALCON_WITH_GPL_READLINE=on \
    -DFALCON_BUILD_FEATHERS=on \
    -DFALCON_BUILD_APPS=on \
    -DFALCON_BUILD_NATMODS=off \
    -DFALCON_BUILD_FWKS=off \
    $srcdir/$_gitname

  make
  #
  # docs are optional, thus these targets have to be built explicitly
  make core_module_docs
  make feathers_module_docs
  #
  # and finally..
  make DESTDIR=$pkgdir install


  # FPLLv1_1 License
  install -D -m644 $srcdir/falcon/LICENSE  $pkgdir/usr/share/licenses/$pkgname/LICENSE
}