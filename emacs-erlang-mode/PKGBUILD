# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Maintainer: Philip Müller <mail{at}philip.in-aachen.net>
pkgname=emacs-erlang-mode
pkgver=R16B
pkgrel=1
pkgdesc="Emacs mode for Erlang"
arch=('any')
url="http://www.erlang.org/"
depends=('emacs')
license=('custom')
source=(https://github.com/erlang/otp/raw/OTP_$pkgver/lib/tools/emacs/erlang_appwiz.el
  https://github.com/erlang/otp/raw/OTP_$pkgver/lib/tools/emacs/erlang.el
  https://github.com/erlang/otp/raw/OTP_$pkgver/lib/tools/emacs/erlang-start.el
  https://github.com/erlang/otp/raw/OTP_$pkgver/lib/tools/emacs/erlang-skels.el
  https://github.com/erlang/otp/raw/OTP_$pkgver/lib/tools/emacs/erlang-skels-old.el
  https://github.com/erlang/otp/raw/OTP_$pkgver/lib/tools/emacs/erlang-flymake.el
  https://github.com/erlang/otp/raw/OTP_$pkgver/lib/tools/emacs/erlang-eunit.el)
md5sums=('e135b919a8168ee581dd305cffd79ef9'
         '6824ba2699dd4d2e998d2966f40fe665'
         '16470301318d4c11cfc14c42d2926c2e'
         '99ed67b37bcd1635bf9a5ab0dadbc431'
         '3662c0a5c787827dfec82b00c076863c'
         'eed724f659a444b9b43ddc7482206944'
         'f9c9f3f88f7be7b0efe5000f0eb75b7e')
install=${pkgname}.install
build() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/"
	for i in "erlang_appwiz" "erlang" "erlang-eunit" "erlang-flymake" "erlang-skels" \
	  "erlang-skels-old" "erlang-start"; do
	  emacs -batch -f batch-byte-compile "$i.el"
	  install -D -m644 "${srcdir}/$i.elc" "${pkgdir}/usr/share/emacs/site-lisp/$i.elc"
	  install -D -m644 "${srcdir}/$i.el" "${pkgdir}/usr/share/emacs/site-lisp/$i.el"
	done
}
