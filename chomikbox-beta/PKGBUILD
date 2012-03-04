# Maintainer: Kamil Markiewicz <k.a.markiewicz at gmail dot com>

pkgname=chomikbox-beta
pkgver=2.0.4.1
pkgrel=2
pkgdesc="Program do chomikowania swoich plikow"
url="http://chomikuj.pl/ChomikBox"
arch=('i686' 'x86_64')
license=('custom')
depends=('qt' 'libpng')
#install='chomikbox.install'
# W boxpostinstall zauwazylem ponizsze depsy. Na razie sie wstrzymamy z pobieraniem
#'gstreamer'
#'gstreamer0.10-tools gstreamer0.10-plugins-base gstreamer0.10-plugins-good
# gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly'

if [ $CARCH == 'i686' ]; then
  _pkg_arch=32
  md5sums=('40aec803bf458a8f51ea8030845cec9c')
elif [ $CARCH == 'x86_64' ]; then
  _pkg_arch=64
  md5sums=('bf7ac35f06ae3f1a3a066ae5311f5a62')
fi

source=("http://bts.box.chomikuj.pl/repo/all/$pkgver/linux$_pkg_arch/ChomikBox-pl-$pkgver-installer.$_pkg_arch.sh")

build() {
  cd "$srcdir"
  _tail_str=$(sed -n '/tail/p' "ChomikBox-pl-$pkgver-installer.$_pkg_arch.sh")
  _tail_str=${_tail_str:10:8}
  tail -c "$_tail_str" "ChomikBox-pl-$pkgver-installer.$_pkg_arch.sh" | tar xjf -
}

package() {  
  cd "$srcdir"
#  echo 'Gotta patch some execs...'
#  ./patchelf --set-rpath "/usr/share/$pkgname" ./chomikbox || return 1
#  ./patchelf --set-rpath "/usr/share/$pkgname" ./configurator || return 1
#  ./patchelf --set-rpath "/usr/share/$pkgname" ./crashsender || return 1
#  echo 'Patching done!'

  install -d "$pkgdir/usr/bin" \
             "$pkgdir/usr/share/$pkgname" \
             "$pkgdir/usr/share/applications"

  install -m755 {chomikbox,configurator,crashsender} "$pkgdir/usr/share/$pkgname"
  install -m644 base.ini "$pkgdir/usr/share/$pkgname"
#  cp -r desktop "$pkgdir/usr/share/$pkgname/desktop"
  cp -r files "$pkgdir/usr/share/$pkgname/files"
  cp -r locale "$pkgdir/usr/share/$pkgname/locale"
  cp -r skins "$pkgdir/usr/share/$pkgname/skins"
  ln -s "/usr/share/$pkgname/chomikbox" "$pkgdir/usr/bin/chomikbox-beta"
#  mv "$pkgdir/usr/share/$pkgname/desktop/chomikbox.desktop" "$pkgdir/usr/share/applications" # first need to patch
}
