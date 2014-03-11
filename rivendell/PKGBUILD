# Maintainer: Sébastien Leblanc
pkgname=rivendell
pkgver=2.8.1
pkgrel=2

# 2014-03-06

pkgdesc="A complete radio broadcast automation solution, with facilities for the acquisition, management, scheduling and playout of audio content."
url="http://www.rivendellaudio.org"
arch=('x86_64' 'i686')
license=('GPL')

options=(!libtool)

makedepends=('patch' 'jack' 'qt3' 'alsa-lib' 'libsamplerate' 'libvorbis' 'taglib' 'id3lib' 
'flac' 'pam' 'qtchooser' 'twolame')
depends=('qt3' 'cdparanoia' 'flac' 'lame' 'soundtouch' curl libxi id3lib)

optdepends=(
  'apache: CGI scripts, required for a stand-alone install'
  'jack: JACK audio support'
  'mysql: Local MySQL database'
  'twolame: MPEG layer 2 support'
  'libvorbis: OGG Vorbis import'
)

backup=('etc/rd.conf')
install='rivendell.install'

source=(
  "http://rivendellaudio.org/ftpdocs/rivendell/$pkgname-$pkgver.tar.gz"
  'rivendell.patch'
  'rivendell-tmpfiles.conf'
)

sha512sums=('4f021868dbac7e66e52bfb0cb3ed26a127145c79dd1a9657b6fe54d6742dd0a4c766f03c6e5f530bf68b30bf6de6ae90548a290b62b70437887b192ff1401519'
            'ffa7a67d8f15caac78f98502867db8d58e1c0567889f27315ef5a40cfd1fad65a13f66fcccd90b5250b43836835e181fe56b8e5697051f00a2bc3d32818b73c5'
            '26fcb0c20d61417e68860f6417e204fbe4dd0c2c1d68883db07d4c6689d7800eb2ddaef05bf2f97b5356e238c7d8d21b2f178085d07da03f82a126a899df3337')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../rivendell.patch
}

build() {
  export QT_SELECT=3
  msg "Making package"
  
  cd "$srcdir/$pkgname-$pkgver"

  sh autogen.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib/rivendell/web --libdir=/usr/lib --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir"/"$pkgname-$pkgver"

  touch building-debian
  make install DESTDIR="$pkgdir" RD_LIB_PATH="lib"

  msg "$pkgname: Executing final packaging steps"
  
  cd "$srcdir"/"$pkgname-$pkgver"
  mkdir -p "$pkgdir"/etc/rivendell.d
  install -t "$pkgdir"/etc/rivendell.d -Dm755 conf/rlm_*.conf
  install -Dm755 conf/rd.conf-sample "$pkgdir"/etc/rd.conf
  install -Dm755 conf/rd-bin.conf "$pkgdir"/etc/httpd/conf/extra/rd-bin.conf

  mkdir -p "$pkgdir"/var/snd

  mkdir -p "$pkgdir"/etc/tmpfiles.d
  cp "$srcdir"/rivendell-tmpfiles.conf "$pkgdir"/etc/tmpfiles.d/rivendell.conf

  # Repair broken symlinks
  ln -sf /usr/lib/rivendell/web/rdfeed.xml "$pkgdir"/usr/lib/rivendell/web/rdfeed.mp3

}
