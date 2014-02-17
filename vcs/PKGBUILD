#
# $Rev: 2105 $
#
# Maintainer (Upstream): Toni Corvera <outlyer@gmail.com>
#
# Build with '$ makepkg' on the same directory as this file
#

pkgname=vcs
pkgver=1.13
pkgrel=1
pkgdesc="tool to create contact sheets (previews) from videos"
arch=('any')
url="http://p.outlyer.net/vcs/"
license=('LGPL')
depends=('bash>=3.1' 'imagemagick>=6.3.5.7' 'mplayer' 'ffmpeg')
makedepends=('bzip2')
optdepends=('lsdvd: for DVD support'
            'perl: for DVD support')
backup=()
options=('docs' 'zipman')
source=($url/files/$pkgname-$pkgver.tar.gz)
md5sums=(64d5abb8458454da9e8ea55faca57b59) #generate with 'makepkg -g'
sha1sums=(aa3980b7295be9fbb46b705a3400a357ea72ce83)
# Debian & Arch didn't agree on this on my first try (???)
sha256sums=(b4c001e3378881fa93459bf79418a3f9d14e18eb38bb0881dbdb6d8d76f48c90)

build() {
  cd $srcdir/$pkgname-$pkgver
  make prepackage
  make install DESTDIR=${pkgdir} prefix=/usr
  install -D $srcdir/$pkgname-$pkgver/examples/vcs.conf.example \
    ${pkgdir}/usr/share/doc/$pkgname/vcs.conf.example
}

#man page (TODO)
# install -D -m644 $pkgname.1 ${pkgdir}/usr/share/man1/$pkgname.1 || return 1

# vim:set filetype=sh ts=2 et: #
