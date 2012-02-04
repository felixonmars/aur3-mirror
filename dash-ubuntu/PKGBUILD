# $Id: PKGBUILD 81892 2010-06-06 21:30:28Z dan $
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=dash-ubuntu
_orig_pkgver=0.5.5.1
_diff_pkgver=7ubuntu1
pkgver=$_orig_pkgver.$_diff_pkgver
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible. Ubuntu version"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
groups=('base')
depends=('glibc')
conflicts=('dash')
source=("http://archive.ubuntu.com/ubuntu/pool/main/d/dash/dash_$_orig_pkgver.orig.tar.gz"
        "http://archive.ubuntu.com/ubuntu/pool/main/d/dash/dash_$_orig_pkgver-$_diff_pkgver.diff.gz")

md5sums=('7ac832b440b91f5a52cf8eb68e172616'
         '2c7eee435fccfa2eda787bf24a951cbe')
sha512sums=('2beab4575808ab9855c13397b25c89e42fd78ea43b1bc11f69e064f4dbe807216012732b01ba5f1177c83b9c31dc9e994ba2a75471bb209ce06b051bec74110c'
            '93f5a8c75ae2200721e6d7a0dcdcab516adbc469bc05973a82d099ce05011f70a30eddd94cdc12bba3dd44f78a653aa14fbebc57123c4b5bafd69342c4b98ed3')

build() {
  cd "$srcdir/dash-$_orig_pkgver"
  patch -p1 < "../dash_$_orig_pkgver-$_diff_pkgver.diff"
  for i in  debian/diff/* ; do patch -p1 < "$i" ; done
  ./configure --prefix=/usr --mandir=/usr/share/man --exec-prefix=""
  make
  make DESTDIR=$pkgdir install

  # license
  install -m644 -D COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
