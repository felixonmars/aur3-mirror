# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=psi-gentoo-i18n
pkgver=0.10
pkgrel=2
pkgdesc="Language-Packs for Psi-Gentoo"
arch=('i686' 'x86_64')
url="http://packages.gentoo.org/packages/?category=net-im;name=psi"
license=('GPL')
depends=('psi-gentoo')
conflicts=('psi-i18n' 'pedrito')

source=("http://distfiles.gentoo.org/distfiles/psi_ar-0.9.3.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_bg-0.10-b-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_ca-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_cs-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_da-0.9.3.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_de-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_el-0.9.3-a.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_eo-0.10-a.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_es-0.10-a.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_et-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_fi-0.9.3.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_fr-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_it-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_hu-0.10-a.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_mk-0.10-a.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_nl-0.10-a.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_pl-0.9.3-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_pt-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_ptBR-0.10-a.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_ru-0.9.3-a.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_se-0.9.3_rc1-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_sk-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_sl-0.10-b-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_sr-0.10-a-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_sv-0.9.3.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_sw-0.9.3.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_vi-0.10-b-1.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/psi_zh-0.10-a-1.tar.bz2")

md5sums=('2885ffd0943e95edc0b8521309b01d32' 'b19a3a6e253b2acd67c0401e2e9d7edb'\
         'a6fb07fa1ff3bede018da995d3899198' '01c5a4ba8399dd2a5d8656c558493875'\
         '208ed7a4f2c8b0aa870beb806c025b6e' 'b18a7cd8a2d8e875f6dda686677cbade'\
         '8a659618968a698ba7a5cd76b46be6f2' '7a8c32d1881f61b5dc3d2243a55034a1'\
         'a0565b1d496baa34a433c1b42f04ac6d' '780f6d96f5498b30b4bd4b186d25250d'\
         'd41e102a476ed319f0bcca4c516b4938' '5a6a1c09e54a42d1657c1eeb1582de01'\
         '6c489185d3e950a8b62f49c8e7930198' 'b5bfba7b5d74fd32e226456e9c1cb581'\
         'e2163b47140c617881141ed2e3d9dbbe' 'b29b85674c0d233960240930a6d6067a'\
         'f270e6ed02653bcf9c638b273b50a7cb' '69b4a108d4a23a9d48326b7d6cc9def4'\
         '8bd6ff47cc42fd3e5664fbb961dd17f3' '5e20def73cdfdee2b9af6798fa75417b'\
         'd2a06916aeb35ec86fd8cff8533e0b3c' '6b06aec2406fd15a8beaaad16d8d4cdb'\
         'd709d8d0680a12babcff167f4cf10f27' 'f2b95bddb3e2fe7419e86fc39d4bf14f'\
         '2773bbf4585e054e7c0ca472b5723014' 'df93122447366aef362bafde0ed67618'\
         'f58fefde629de6227621e45bb1d51569' 'd951d267125b89251afab06b2fce57a6')

build() {
	cd $startdir/src/langs
	install -m 0755 -d $startdir/pkg/usr/share/psi/
	install -m 0644 psi_*.qm $startdir/pkg/usr/share/psi
}
