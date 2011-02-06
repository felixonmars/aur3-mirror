# Contributor: Paul Gideon Dann <pdgiddie+arch@gmail.com>
pkgname=xorg-xkb-utils-git
pkgver=git
pkgrel=1
pkgdesc="X.org keyboard utilities"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org"
license=('GPL')
depends=('libxaw>=1.0.5' 'libxkbfile')
makedepends=(git pkgconfig)
provides=('xorg-xkb-utils')
conflicts=('xorg-xkb-utils')
source=()
md5sums=()

_gitroot="git://anongit.freedesktop.org/xorg"
_macrorepo="util/macros"
_repos="app/xkbutils app/xkbcomp app/xkbevd app/setxkbmap"

build() {
  cd "$srcdir"

  msg "Fetching macros"
  if [ -d macros ]; then
    cd macros
    git clean -xdf
    git fetch origin
    git reset --hard origin/HEAD
  else
    git clone $_gitroot/$_macrorepo macros
  fi

  msg "Configuring macros"
  cd $srcdir/macros
  ./autogen.sh || return 1

  for repo in $_repos; do
    cd $srcdir
    local projname=`echo $repo | awk -F/ '{print $NF }'`
    msg "Fetching $projname"
    if [ -d $projname ]; then
      cd $projname
      git clean -xdf
      git fetch origin
      git reset --hard origin/HEAD
    else
      git clone $_gitroot/$repo
    fi

    msg "Configuring $projname"
    cd $srcdir/$projname
    ACLOCAL="aclocal -I $srcdir/macros" ./autogen.sh --prefix=/usr || return 1

    msg "Building $projname"
    make || return 1

    msg "Staging $projname"
    make DESTDIR="$pkgdir" install || return 1
  done
} 
