# Maintainer: Cravix < dr dot neemous at gmail dot org >
# Contributor: Ronald van Haren <ronald.archlinux.org>

# That's only what I select. Change it as you want.
# the order is the same as the module sets order in ./DOC.
defset=(alarm deskshow exebuf mail news places winselector forecasts 
  engage 
  empris 
  eenvader.fractal photo slideshow 
  eektool execwatch 
  everything-mpris everything-pidgin everything-tracker everything-websearch
)

pkgname=e-modules-extra-svn
_pkgname=E-MODULES-EXTRA
pkgver=84534
pkgrel=2
pkgdesc="Extra gadgets for e17 (NOTE: ***for enlightenment17 ONLY***, if you're using enlightenment17-git, use e-modules-extra-git instead)"
arch=('i686' 'x86_64')
groups=('e17-extra-svn')
url="http://www.enlightenment.org"
license=('GPLv2' 'LGPLv2' 'MIT')
depends=('enlightenment17')
makedepends=('subversion')
optdepends=('eweather-git: nice weather forecast module')
conflicts=('e-modules-extra')
provides=('e-modules-extra')
options=('!libtool')
source=('REST' 'DOC'
        "svn+http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA#revision=84534")
md5sums=('31c815db3472b91a4cba273281f8fa1e'
         '85443d725a3aebe1a7680cad505b0630'
         'SKIP')

#you need to get over it...
[[ -n "$(pacman -Qq enlightenment17-git 2>/dev/null)" ]] &&
{
  echo -e "$(tput bold)This package is only compatible with e17 official release.
You're enlightenment17-git user, so please ***USE e-modules-extra-git INSTEAD***. Sorry for inconvenience.
Exiting...$(tput sgr0)"
  exit 1
}

echo -e "$(tput bold)You can customize the module set (defset) on your own in PKGBUILD.
Also, read ./DOC for more info about the functions of modules.$(tput sgr0)"
sleep 1
pkgver() {
  [[ -z $(pacman -Q efl-git 2>/dev/null) ]] && echo 84534 || {
    cd "$SRCDEST/$_pkgname"
    LC_ALL=C svn info | awk '/Last Changed Rev/ {print $4}'
  }
}

build() {

  cd "$srcdir/$_pkgname"
    
  for i in ${defset[@]}; do
    cd $i
    ./autogen.sh --prefix=/usr
    make
    cd ..
  done
} 

package() {
  cd $srcdir/$_pkgname

  for i in ${defset[@]}; do
    cd $i
    make DESTDIR=$pkgdir install
    # install license files
    if [ -e $srcdir/$_svnmod-build/$i/COPYING ]; then
      install -Dm644 $srcdir/$_svnmod-build/$i/COPYING \
          $pkgdir/usr/share/licenses/$pkgname/$i/COPYING
    fi
    if [ -e $srcdir/$_svnmod-build/$i/COPYING-PLAIN ]; then
      install -Dm644 $srcdir/$_svnmod-build/$i/COPYING-PLAIN \
          $pkgdir/usr/share/licenses/$pkgname/$i/COPYING-PLAIN
    fi
    cd ..
 done
}
