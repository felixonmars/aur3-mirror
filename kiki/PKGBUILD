# Contributor: gyo <gyo@archlinux.fr>
pkgname=kiki
pkgver=1.0.2
pkgrel=5
pkgdesc="A 3D-puzzle Sokoban-like game"
arch=('i686')
url="http://kiki.sourceforge.net/"
license=('custom:public-domain')
depends=('python2' 'freeglut' 'sdl_image' 'sdl_mixer')
makedepends=('swig')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver-src.tgz
	$pkgname-$pkgver-gcc41.patch 
	$pkgname-$pkgver-freeglut.patch
	$pkgname-$pkgver-gcc42.patch
	$pkgname-$pkgver-gcc44.patch)
md5sums=('eb4966eae85d3a073aab521bf1ba33e2'
         '5552203a107efad60340d522ef36b5e9'
         '380ce89a54ed8392dae758929be001cf'
         '897fd6599eaeee432bd3c36fdc6f9fd8'
         '3155b3f4f24d8988cdd63282d3a8958f')

build() {
  cd $srcdir/kiki

  for file in $srcdir/*.patch; do
    patch -Np0 < $file || return 1
  done

  sed -i \
    -e "s:kiki_home += \"/\";:kiki_home = \"/usr/share/$pkgname/\";:g" \
    -e "/KConsole::printf(\"WARNING :: environment variable KIKI_HOME not set ...\");/d" \
    -e "/KConsole::printf(\"           ... assuming resources in current directory\");/d" \
    src/main/KikiController.cpp \
    || return 1

  _pyver=$(python2 -V 2>&1 | awk '{print $2}')
  sed -i \
    -e "/^PYTHON_VERSION/s/2.3/${_pyver}/" \
    -e '/lib-dynload/d' \
    -e '/^PYTHONLIBS/s:\\:-lpython$(PYTHON_VERSION):' \
    linux/Makefile \
    || return 1

  cd SWIG
  swig -c++ -python -globals kiki -o KikiPy_wrap.cpp KikiPy.i || return 1
  cp -f kiki.py ../py
  cd ..

  make -C kodilib/linux/ || return 1
  make -C linux/ || return 1

  sharedest=$pkgdir/usr/share/$pkgname
  install -D -m755 linux/kiki $pkgdir/usr/bin/kiki
  install -d $sharedest/sound
  install -m644 sound/* $sharedest/sound
  install -d $sharedest/py/{lang,levels}
  find py -type f | xargs -I xxx install -m644 xxx $sharedest/xxx
}
