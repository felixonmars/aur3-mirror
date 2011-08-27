    # Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
    # Contributor: Larry Hajali <larryhaja[at]gmail[dot]com>
    # Contributor: said
     
    pkgname=qutecom
    pkgver=2.2.1
    pkgrel=1
    pkgdesc="A free VoIP softphone, superseding WengoPhone"
    arch=('i686' 'x86_64')
    url="http://trac.qutecom.org/"
    license=('GPL')
    depends=('qt' 'ffmpeg' 'python2' 'libsamplerate' 'gnutls' 'speex' 'boost-libs'
             'v4l-utils')
    makedepends=('cmake' 'boost')
    install=qutecom.install
    source=("${url}/downloads/${pkgname}-${pkgver}.tar.gz"
            'new-videodev.patch')
    md5sums=('6f7569c75e7c7978e0a187b3c8795bfa'
             '52b536108d9c9aabe6e07a18f72db81b')
     
    build() {
      cd "${srcdir}"/${pkgname}-${pkgver}
      patch -p1 -i "${srcdir}"/new-videodev.patch
     
      cd "${srcdir}"
      mkdir build
      cd build
      cmake ../${pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
     
      make
    }
     
    package() {
      cd "${srcdir}"/build
      make DESTDIR="${pkgdir}" install
    }
