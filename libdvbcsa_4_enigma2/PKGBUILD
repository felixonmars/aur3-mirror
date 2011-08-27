# Contributor: Stas Bourakov <sbourakov(at)gmail.com>
pkgname=libdvbcsa_4_enigma2
pkgver=13
pkgrel=1
pkgdesc="libdvbcsa is a free and portable implementation of the DVB Common
Scrambling algorithm with decryption and encryption capabilities."
arch=('i686' 'x86_64')
url="http://www.videolan.org/developers/libdvbcsa.html"
license=('GPL2')
depends=('gcc-libs')
makedepends=('svn' 'autoconf' 'automake' 'bison' 'fakeroot' 'flex' 'gcc' 'libtool' 'm4' 'make' 'patch' 'pkg-config')
conflicts=(libdvbcsa)

_svntrunk="svn://svn.videolan.org/libdvbcsa/trunk"
_svnmod=libdvbcsa

build() {
  cd "$srcdir"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  #
  # BUILD
  #
     autoreconf -i || return 1
    #./bootstrap || return 1
    ./configure --prefix=/usr --enable-sse2 || return 1
    make || return 1
    make install DESTDIR=$pkgdir || return 1
}
