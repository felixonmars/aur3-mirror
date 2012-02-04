# Maintainer: StephenB <mail4stb at gmail dot com>

pkgname="urxvt-mark-yank-urls"
pkgver=1
pkgrel=1
pkgdesc="mouseless url yanking for rxvt-unicode (urxvt)"
arch=("any")
depends=('rxvt-unicode' 'xclip' 'perl-clipboard')
replaces=('rxvt-url-yank')
install=('urxvt-mark-yank-urls.install')
license=("GPL")
url='http://www.jukie.net/bart/blog/urxvt-url-yank'
_horrid_mark_yank_urls_filename='urxvt.git?a=blob_plain;f=mark-yank-urls;h=831f95efe3b88508ef7ea7946875a8b7d8d5e581;hb=1dc9f95f4e974d990ebdc0fed02e994e1eb7c2db'
source=("http://gitweb.jukie.net/urxvt.git/urxvt.git/urxvt.git/${_horrid_mark_yank_urls_filename}")
md5sums=('6675a88f890a20a4e3fed0d744aa78d6')

build() {
  install -Dm644 "${srcdir}/${_horrid_mark_yank_urls_filename}" \
      ${pkgdir}/usr/lib/urxvt/perl/mark-yank-urls
}
