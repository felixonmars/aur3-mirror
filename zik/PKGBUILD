# Contributor:  <mathieuIVI@gmail.com>
pkgname=zik
pkgver=0.14.0
pkgrel=1
pkgdesc="Zik , a lightweight music player written in ruby "
arch=('i686' 'x86_64')
url="http://zik.developpez.com/"
license=('GPL')
#depends=('ruby-gnome2' 'ruby-gettext' 'ruby-gstreamer' 'librsvg'
depends=('ruby-gettext' 'ruby-gstreamer' 'librsvg'
         'gstreamer0.10-base-plugins' 'ruby-gtk2')
optdepends=('ruby-musicbrainz: for CD support'
            'gstreamer0.10-good-plugins: for CD support'
            'gstreamer0.10-ugly-plugins: for CD support'
            'gstreamer0.10-plugins: for the others audio formats'
            'ruby-mp3info: for cover display'
            'ruby-libnotify: notifications support')
source=("http://projets.developpez.com/attachments/download/485/ZiK-${pkgver}.tar.gz"
        "taglib.rb")
md5sums=('a36f0ff6e2e14100c2acffb3f33c7b3a'
         '4d9e63ecb22587116ce6eddd6a3d9713')
build() {
  cd $srcdir
  # This is really ugly, but I can't fix the ruby-taglib package, since it's not mine, the maintainer is notified
  mkdir -p $pkgdir/usr/lib/ruby/site_ruby/1.9.1
  cp taglib.rb $pkgdir/usr/lib/ruby/site_ruby/1.9.1/
  cd "ZiK-$pkgver"
  make check-depend || return 1
  ./configure --prefix=/usr
  mkdir -p $pkgdir/usr/bin
  make || return 1
  make PREFIX=$pkgdir/usr install || return 1
}
