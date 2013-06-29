# Maintainer: X0rg

pkgname=psensor-catalyst
_pkgname=psensor
_gitname=AMD_ADL_SDK
pkgver=0.8.0.3
pkgrel=3
pkgdesc="Psensor is a graphical hardware temperature monitor for Linux with AMD proprietary driver support."
arch=('any')
url="http://wpitchoune.net/psensor"
license=('GPL2' 'ADL SDK')
depends=('lm_sensors' 'gconf' 'pango' 'gtk3>=3.4' 'help2man')
makedepends=('git' 'make' 'gcc')
optdepends=('asciidoc: required to produce the HTLM version of the FAQ'
	'cppcheck: static source checker'
	'libnotify: support for notifications'
	'libappindicator: to allow applications to export a menu into the Unity Menu bar'
	'curl: required for remote monitoring'
	'json-c: required for remote monitoring'
	'libgtop: required for CPU usage'
	'libatasmart: for disks monitoring'
	'hddtemp: for disks monitoring')
conflicts=('psensor' 'xf86-video-ati' 'xf86-video-intel' 'xf86-video-nouveau' 'nvidia-304xx' 'nvidia-173xx' 'nvidia-96xx')
source=("http://wpitchoune.net/psensor/files/$_pkgname-$pkgver.tar.gz"
	"git://github.com/X0rg/$_gitname.git"
	'ADL_SDK')
md5sums=('f44579b92e1327c75c1582e464bfafac'
         'SKIP'
         'fed30c8e9f0964e9c15b22de6a617f0f')

build() {
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Copie quelques bibliothèques pour la compilation avec le support de Catalyst..."
  else
    msg2 "Copy some libraries for compiling with Catalyst support..."
  fi
  (set -x ; cp $_gitname/include/adl_defines.h		$_pkgname-$pkgver/src/lib)
  (set -x ; cp $_gitname/include/adl_sdk.h		$_pkgname-$pkgver/src/lib)
  (set -x ; cp $_gitname/include/adl_structures.h	$_pkgname-$pkgver/src/lib)

  cd $_pkgname-$pkgver
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'configure'..."
  else
    msg2 "Run 'configure'..."
  fi
  ./configure --with-libatiadl=$srcdir/$_gitname --prefix=/usr --sysconfdir=/etc
	
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'make'..."
  else
    msg2 "Run 'make'..."
  fi
  make clean all -j1 # With '-jN' where N>1, there are errors.
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m644 $srcdir/ADL_SDK $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
