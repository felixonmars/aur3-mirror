#!/bin/bash

if [[ -z "$MOZCVER" || -z "$DICVER" ]]; then
    echo '$MOZCVER or $DICVER is not specified.'
    exit 1
fi



##################################################
# remove tmp files
##################################################

rm -f mozcdic*.txt*
rm -f costlist
rm -f id.def
rm -f ut-*.txt*
rm -f */*.txt.r

rm -f chimei/*.CSV
rm -f chimei/*.zip
rm -f chimei/chimei.txt
rm -f chimei/gen_zip_code_seed.py

rm -rf ../mozc-ut-$MOZCVER.$DICVER/



##################################################
# generate the mozc-ut dictionary
##################################################

# get official mozcdic
cat ../mozc-$MOZCVER/data/dictionary_oss/dictionary*.txt > mozcdic_all.txt

# get mozcdic costlist
ruby 32-* mozcdic_all.txt
mv mozcdic_all.txt.cost costlist

# get hinsi ID
cp ../mozc-$MOZCVER/data/dictionary_oss/id.def .


# generate chimei.txt
echo "generate chimei.txt..."
cd chimei/
ruby get-entries.rb ../../KEN_ALL.CSV
cd -



# check major ut dictionaries
echo "check major ut dictionaries..."

# ruby 12-* dicfile min_hits
ruby 12-* altcanna/altcanna.txt 300
ruby 12-* jinmei/jinmei.txt 20
ruby 12-* ekimei/ekimei.txt 300
ruby 12-* chimei/chimei.txt 300

cat altcanna/altcanna.txt.r jinmei/jinmei.txt.r ekimei/ekimei.txt.r \
chimei/chimei.txt.r > ut-dic1.txt

ruby 44-* mozcdic_all.txt ut-dic1.txt
ruby 36-* ut-dic1.txt.yomihyouki

cat ut-dic1.txt.yomihyouki.cost mozcdic_all.txt > mozcdic_all.txt.utmajor



# check minor ut dictionaries
echo "check minor ut dictionaries..."

ruby 12-* skk/skk.txt 300
ruby 12-* edict/edict.txt 300
ruby 12-* hatena/hatena.txt 300

if [ $NICODIC = "true" ]
then
	ruby 12-* niconico/niconico.txt 300
fi

cat skk/skk.txt.r hatena/hatena.txt.r > ut-dic2.txt

[[ "$EDICT" = "yes" ]] && cat edict/edict.txt.r >> ut-dic2.txt

if [ $NICODIC = "true" ]
then
	cat niconico/niconico.txt.r ut-dic2.txt > ut-dic2.txt.new
	mv ut-dic2.txt.new ut-dic2.txt
fi

ruby 42-* mozcdic_all.txt.utmajor ut-dic2.txt
ruby 40-* mozcdic_all.txt.utmajor ut-dic2.txt.yomi
ruby 36-* ut-dic2.txt.yomi.hyouki



# add yomigana ba
# 「べーとーべん」から「ベートーヴェン」に変換できるようにする
echo "generate babibubebo from vavivuvevo..."

cat *.cost mozcdic_all.txt > ut-check-va.txt
ruby 60-* ut-check-va.txt
ruby 62-* ut-check-va.txt.va



##################################################
# install the mozc-ut dictionary
##################################################

# install mozcdic-ut
cat *.cost *.va.to_ba > dictionary-ut.txt
cat dictionary-ut.txt >> ../mozc-$MOZCVER/data/dictionary_oss/dictionary00.txt


# change mozc branding
sed -i 's|"Mozc"|"Mozc-UT"|g' ../mozc-$MOZCVER/base/const.h

# install docs
DIC="altcanna chimei ekimei hatena jinmei skk"
[[ "$EDICT" = "yes" ]] && DIC+=" edict"

if [ $NICODIC = "true" ]
then
	DIC+=" niconico"
fi

for d in $DIC
do
	mkdir -p ../mozc-$MOZCVER/doc-ut/dictionary/${d}
	cp -f ${d}/doc/* ../mozc-$MOZCVER/doc-ut/dictionary/${d}/
done



cp README ../mozc-$MOZCVER/doc-ut/
cp ChangeLog ../mozc-$MOZCVER/doc-ut/

# rename mozc dir to mozc-ut
cd ..
mv mozc-$MOZCVER mozc-ut-$MOZCVER.$DICVER
cd -

