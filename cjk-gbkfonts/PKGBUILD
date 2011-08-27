# $Id: PKGBUILD,v 1.41 2008/01/01 13:40:56 andyrtr Exp $
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=cjk-gbkfonts
pkgver=1.0
pkgrel=1
pkgdesc="cjk-latex"
arch=('i686' 'x86_64')
license=('GLP')
groups=('tetex')
url="ftp://ftp.gw.com/mirrors/pub/unix/file/"
depends=('tetex' 'cjk')
options=
install=('install')
source=(http://www.zhyfly.org/projects/source/hanzi.tar.gz
        http://www.zhyfly.org/projects/source/gbkfonts)

md5sums=('d0f61a82257f38db127de6f5a9eb523b'
         'a3a48f09b2f0021f998988f91fb1f056'
         'adabfc3777c7f527c60235b4b55078ab')

build() {
  chmod +x ${startdir}/src/gbkfonts
  mkdir -p  ${startdir}/pkg/usr/share/texmf
#生成生体
  cd ${startdir}/pkg/usr/share/texmf
  ${startdir}/gbkfonts ${startdir}/hanzi/simsun.ttf song
  ${startdir}/gbkfonts ${startdir}/hanzi/simhei.ttf hei
  ${startdir}/gbkfonts ${startdir}/hanzi/simkai.ttf kai
  ${startdir}/gbkfonts ${startdir}/hanzi/simfang.ttf fs
#  ${startdir}/gbkfonts ${startdir}/hanzi/simli.ttf li
#  ${startdir}/gbkfonts ${startdir}/hanzi/simyou.ttf you
#  ${startdir}/gbkfonts ${startdir}/hanzi/stfangso.ttf fangsong
#  ${startdir}/gbkfonts ${startdir}/hanzi/stcaiyun.ttf stcaiyun
#  ${startdir}/gbkfonts ${startdir}/hanzi/stxihei.ttf stxihei
#  ${startdir}/gbkfonts ${startdir}/hanzi/stxingka.ttf stxingka
#  ${startdir}/gbkfonts ${startdir}/hanzi/stxinwei.ttf stxinwei
#  ${startdir}/gbkfonts ${startdir}/hanzi/stzhongs.ttf stzhongs
#  ${startdir}/gbkfonts ${startdir}/hanzi/stliti.ttf stliti
#  ${startdir}/gbkfonts ${startdir}/hanzi/stsong.ttf stsong
#  ${startdir}/gbkfonts ${startdir}/hanzi/stkaiti.ttf stkaiti
#  ${startdir}/gbkfonts ${startdir}/hanzi/fzstk.ttf fzstk
#  ${startdir}/gbkfonts ${startdir}/hanzi/fzytk.ttf fzytk
#配置
  mkdir -p ${startdir}/pkg/usr/share/texmf/dvips/config
  cp /usr/share/texmf-dist/dvips/config/config.ps  ${startdir}/pkg/usr/share/texmf/dvips/config
  cp cjk.map ${startdir}/pkg/usr/share/texmf/dvips/config
  echo "p +cjk.map" >> ${startdir}/pkg/usr/share/texmf/dvips/config/config.ps

  cp cid-x.map ${startdir}/pkg/usr/share/texmf/dvipdfm/config
  cp /usr/share/texmf-dist/dvipdfm/config/config  ${startdir}/pkg/usr/share/texmf/dvipdfm/config
   echo "f cid-x.map" >> ${startdir}/pkg/usr/share/texmf/dvipdfm/config/config

  cp cjk.map ${startdir}/pkg/usr/share/texmf/pdftex/config
  cp pdftex.cfg ${startdir}/pkg/usr/share/texmf/pdftex/config
  echo "map +cjk.map" >> ${startdir}/pkg/usr/share/texmf/pdftex/config/pdftex.cfg
  
}


