# Maintainer: Daniel Landau <daniel.landau@iki.fi>
# Contributor: Xyne
# Contributor: David Manouchehri <d@32t.ca>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Thomas Jost <schnouki schnouki net>
# Contributor: Hinrich Harms <arch hinrich de>

# the PKGBUILD lives in https://github.com/daniellandau/AUR-thunderbird-enigmail
# pull requests are welcome

pkgname=thunderbird-enigmail
pkgver=1.6
pkgrel=2
_tbver=24.2.0
pkgdesc="Thunderbird extension that enables sending and receiving signed and encrypted e-mail messages"
arch=('i686' 'x86_64')
url="https://www.enigmail.net/"
license=('MPL' 'GPL')
depends=('thunderbird' 'gnupg')
makedepends=('zip' 'unzip' 'python2')
source=("https://www.enigmail.net/download/source/enigmail-${pkgver}.tar.gz"
        "ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$_tbver/source/thunderbird-$_tbver.source.tar.bz2"
        mozconfig
        thunderbird-nspr-bug.patch)
sha256sums=('10d5eb7ba364b9b6e6275aae8bba1d0e4321ed7d55a715337d566ccf2a56ea4d'
            '66474132bd6ebbb8a913c3f4acd4ecc9bec011e4c7ee49475f29558801a905cf'
            '987e0bdfc52b9580abe3d9fdb62507b23d1a6f2df3e91c5832e66a423172921b'
            '449124d4c29724da78a3463513207e1016adc01a73a8360480031826c6f207dd')

prepare() {
  cd "$srcdir/comm-esr${_tbver%%.*}"

  cp "$srcdir/mozconfig" .mozconfig
  # needs to be an absolute path
  sed -i'' -e "s:@OBJDIR@:$srcdir/comm-esr${_tbver%%.*}/obj:" .mozconfig

  # configure script misdetects the preprocessor without an optimization level
  # https://bugs.archlinux.org/task/34644
  sed -i '/ac_cpp=/s/$CPPFLAGS/& -O2/' mozilla/configure

  # There's a bug with using system tier_nspr:
  # https://bugzilla.mozilla.org/show_bug.cgi?id=909076
  patch -Np1 -i "$srcdir/thunderbird-nspr-bug.patch"
}

build() {
  cd "$srcdir/comm-esr${_tbver%%.*}"

  make -f client.mk configure MOZ_MAKE_FLAGS="$MAKEFLAGS"
  cd obj

  make -C mozilla tier_base tier_js
  make export
  cd ..

  # Compile Enigmail
  cp -R "$srcdir"/enigmail "$srcdir"/comm-esr${_tbver%%.*}/mailnews/extensions
  cd mailnews/extensions/enigmail
  ./makemake -r
  cd "$srcdir/comm-esr${_tbver%%.*}"/obj/mailnews/extensions/enigmail
  make

  # Create the Enigmail XPI
  make xpi
}

package() {
  cd "$srcdir/comm-esr${_tbver%%.*}"

  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' mailnews/extensions/enigmail/package/install.rdf)"

  install -d -m755 "$pkgdir"/usr/lib/thunderbird/extensions/"$emid"
  cd "$pkgdir"/usr/lib/thunderbird/extensions/"$emid"

  unzip "$srcdir"/comm-esr${_tbver%%.*}/obj/mozilla/dist/bin/enigmail-*.xpi
}
