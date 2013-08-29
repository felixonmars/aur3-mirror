# Maintainer: Daniel Kozak <kozzi11@gmail.com>

_pkgname=mono
pkgname=mono-latest
pkgver=3.2.1
pkgrel=1
pkgdesc="Free implementation of the .NET platform including runtime and compiler"
arch=(i686 x86_64)
license=('GPL' 'LGPL2' 'MPL' 'custom:MITX11')
url="http://www.mono-project.com/"
depends=('zlib' 'libgdiplus>=2.10' 'sh')
makedepends=('git' 'pkgconfig' 'mono')
options=('!libtool' '!makeflags')
provides=('monodoc' mono=${pkgver})
conflicts=('mono' 'monodoc')
source=(git://github.com/${_pkgname}/${_pkgname}.git
        mono.binfmt.d)
md5sums=('SKIP'
         'b9ef8a65fea497acf176cca16c1e2402')


build() {

  cd ${srcdir}/${_pkgname}
  git checkout ${_pkgname}-${pkgver}-branch
  git submodule update --init --recursive || return 1

  # build mono
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
             --with-libgdiplus=installed
  make || return 1

  # build jay
  cd ${srcdir}/${_pkgname}/mcs/jay
  make || return 1
}

package() {
  
  cd ${srcdir}/${_pkgname}  
  make DESTDIR=${pkgdir} install || return 1

  # install jay
  cd ${srcdir}/${_pkgname}/mcs/jay
  make DESTDIR="${pkgdir}" prefix=/usr install=../../install-sh install
  cd ${srcdir}/${_pkgname}

  # install binfmt conf file and pathes
  install -D -m644 "${srcdir}"/mono.binfmt.d "${pkgdir}"/usr/lib/binfmt.d/mono.conf

  #install license
  mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}
  install -m644 mcs/MIT.X11 "${pkgdir}"/usr/share/licenses/${_pkgname}/
  
  #fix .pc file to be able to request mono on what it depends, fixes #go-oo build
  sed -i -e "s:#Requires:Requires:" ${pkgdir}/usr/lib/pkgconfig/mono.pc

}

