# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ly2video
pkgver=0.4.1
pkgrel=1
pkgdesc="A script to generate a video from a Lilypond sheet music file"
arch=(any)
url=https://github.com/aspiers/ly2video
license=(GPL3)
depends=(ffmpeg lilypond python2-imaging python2-midi python2-pypdf timidity++)
source=($url/archive/v$pkgver.tar.gz
    setup.py)
sha256sums=('0c31a9f163a13026ec399bd9b83f4d481a849c4294915967462bbe7eeb939f9f'
    '6d1b1d9d692579b5c871d7bf8341dd8f5e27ffd5136449fd50b4ed8d82bd80c2')
sha512sums=('da1120fb9d6c0f0220a74025bd26340ca9e5849ba2c7b57fb3161a276ad0edaf11f5f4c23688327a18fb1df462923371ffe7f243d576eac99860c806920edbde'
    'de8e5887374b9f11aa16d71d158b424ee1e3c41c292085367c219ff159e1d1ec3f3e72217b86dcde7f119149c16f308820e675e98564b8010ac44d677967f607')

build() {
    cd $pkgname-$pkgver/
    mv ../setup.py .
    python2 setup.py build
}

package() {
    cd $pkgname-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
}
