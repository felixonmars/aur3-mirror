# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=rmanedit
pkgver=1.0.1
pkgrel=1
_ruby="/usr/bin/ruby"
_gem="/usr/bin/gem"
pkgdesc="UNIX Manual Page Editor with Ruby and GTK"
arch=('i686' 'x86_64')
url="http://comu.github.com/RManEdit/"
license=('CCPL-by-nc-sa')
depends=('ruby>=1.9.1' 'ruby-gtk2' 'man2html' 'ruby-filemagic' 'ruby-gtk-webkit-ruby>=0.0.5' 'ruby-rubyzip' 'ruby-gettext')
makedepends=('ruby-pkgconfig')
source=("https://github.com/COMU/RManEdit/tarball/v${pkgver}")
sha256sums=("f5b3ce94f5683a469e45d28f0480ae7be940cb830b8831a08cb95d1c4c236941")

build() {
  cd "$srcdir/COMU-RManEdit-80f445e"
  $_gem build rmanedit.gemspec || return 1
}

_rbconfig() {
  $_ruby -e "require 'rbconfig'; puts RbConfig::CONFIG['$1']"
}

package() {
  cd "$srcdir/COMU-RManEdit-80f445e"

  _gemdestdir=$($_gem environment gemdir)
  _gemdir=$pkgdir$_gemdestdir
  _bindir=$pkgdir$(_rbconfig bindir)

  install -d -m755 $_bindir $_gemdir
  $_gem install --no-user-install --bindir $_bindir \
      --install-dir $_gemdir RManEdit-1.0.0.gem || return 1

  install -m755 rmanedit $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/pixmaps
  install -m644 images/* $pkgdir/usr/share/pixmaps
#  mkdir -p $pkgdir/usr/local/share/locale/tr/LC_MESSAGES
#  ruby rmsgfmt po/tr/rmanedit/po -o /usr/local/share/locale/tr/LC_MESSAGES/rmanedit.mo
}
