# Maintainer: X0rg

pkgname=gnustep-make-clang-git
_gitname=gnustep-make
pkgver=2909.2f9a49e
pkgrel=2
pkgdesc="The GNUstep make package, using Clang"
arch=('any')
url="http://www.gnustep.org/"
license=('GPL3')
groups=('gnustep-clang-git')
depends=('bash')
makedepends=('git' 'clang')
conflicts=('gnustep-make' 'gnustep-make-svn')
options=('!emptydirs')
source=('git://github.com/gnustep/gnustep-make.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_gitname
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Change l'emplacement par défaut des bibliothèques de GNUstep-Clang dans le fichier '/etc/GNUstep/GNUstep.conf'..."
  else
    msg2 "Change the default path of GNUstep libraries in '/etc/GNUstep/GNUstep.conf' file..."
  fi
  (set -x ; sed -i 's|GNUSTEP_SYSTEM_LIBRARIES=@GNUSTEP_SYSTEM_LIBRARIES@|GNUSTEP_SYSTEM_LIBRARIES=/usr/share/GNUstep/lib|' ./GNUstep.conf.in)
  (set -x ; sed -i 's|GNUSTEP_LOCAL_LIBRARIES=@GNUSTEP_LOCAL_LIBRARIES@|GNUSTEP_LOCAL_LIBRARIES=/usr/share/GNUstep/lib|' ./GNUstep.conf.in)
}

build() {
  cd $_gitname
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'configure'..."
  else
    msg2 "Run 'configure'..."
  fi
  CC=clang CXX=clang++ ./configure --prefix=/usr --sysconfdir=/etc/GNUstep
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Installe le fichier '/etc/profile.d/GNUstep.sh'..."
  else
    msg2 "Install '/etc/profile.d/GNUstep.sh' file..."
  fi
  install -v -D -m755 $pkgdir/usr/share/GNUstep/Makefiles/GNUstep.sh $pkgdir/etc/profile.d/GNUstep.sh
}