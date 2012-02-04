# Maintainer: TDY <tdy@gmx.com>

pkgname=fl_teachertool
pkgver=0.70
pkgrel=1
pkgdesc="A classroom management suite"
arch=('i686' 'x86_64')
url="http://www3.telus.net/public/robark/Fl_TeacherTool/"
license=('GPL')
depends=('fltk' 'gthumb' 'imagemagick' 'libxpm' 'tightvnc' 'vncreflector'
         'vncsnapshot')
optdepends=('gksu: for desktop menu support'
            'xscreensaver: for screen lock support')
install=$pkgname.install
source=(http://www3.telus.net/public/robark/Fl_TeacherTool/$pkgname-$pkgver-src.tar.gz
        doc.html tt.desktop vrpass)
md5sums=('b80477ce02d2ea24f1447a70deabcdee'
         'f8f602929bef067cc58bcbac143066ad'
         '43f3116acfb3e42abff4aa7a55183fd2'
         '75578953695df4aae11c919873a36ddb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr sysconfdir=/etc 2> /dev/null || return 1
  make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install || return 1
  install -Dm644 applered.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm644 ../tt.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../doc.html "$pkgdir/usr/share/doc/$pkgname/documentation.html"
  install -Dm644 ../vrpass "$pkgdir/etc/$pkgname/teacher/vncreflectorpass"
  ln -sf vncviewer "$pkgdir/usr/bin/teachertool-vncviewer"
  ln -sf vncpasswd "$pkgdir/usr/bin/teachertool-vncpasswd"
}
