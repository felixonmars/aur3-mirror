# Maintainer: Hyperair <hyperair@gmail.com>
pkgname=sysinfo
pkgver=0.7
pkgrel=8
pkgdesc="Display some useful computer and system information"
arch=('i686' 'x86_64')
url="http://gsysinfo.sourceforge.net/project/"
license="GPL"
depends=('gnome-sharp')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/sourceforge/gsysinfo/$pkgname-$pkgver.tar.gz
        sysinfo_arch.diff
        process_namespace.diff
        nvidia_exceptions.diff
        arch_logo.png)
md5sums=('8fa9b43541f22d09df67930459b99f10'
         '77704a94ddf89971d6ae22757df68a32'
         '78d9ca6cd2310235906e0f3f32668e85'
         'dfec76614b0d182a804e9904f3595066'
         'c4398d269d72e0c3498bf327542b5d8b')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"

  cd $startdir/src/$pkgname-$pkgver
  cp $startdir/src/arch_logo.png artwork/
  patch -p1 -i ../process_namespace.diff || return 1
  patch -p1 -i ../sysinfo_arch.diff || return 1
  patch -p1 -i ../nvidia_exceptions.diff || return 1
  sed -i 's/+ +/+/' Sysinfo/SystemInfo.cs || return 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install
  rmdir $startdir/pkg/usr/lib/pkgconfig

  rm -rf "${MONO_SHARED_DIR}"
}
